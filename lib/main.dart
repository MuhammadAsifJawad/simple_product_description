import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(rate: 4.5, price: 9999, roomNo: 8),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.rate,
    required this.price,
    required this.roomNo,
  });
  final rate;
  final price;
  final roomNo;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDateIn;
  TimeOfDay? _selectedTimeIn;
  int dayIn = 05;
  int monthIn = 12;
  int yearIn = 2023;
  int hoursIn = 12;
  int minutsIn = 00;
  DateTime? _selectedDateOut;
  TimeOfDay? _selectedTimeOut;
  int dayOut = 05;
  int monthOut = 12;
  int yearOut = 2023;
  int hoursOut = 12;
  int minutsOut = 00;
  Future<void> _selectDate(BuildContext context, int choice) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (choice == 1)
          _selectedDateIn = picked;
        else
          _selectedDateOut = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, int choice) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (choice == 1)
          _selectedTimeIn = picked;
        else
          _selectedTimeOut = picked;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 310,
                child: Stack(
                  children: [
                    Image.network(
                        'https://th.bing.com/th/id/OIP.87JimXlGXeIFqhyDmh0p-gHaFj?pid=ImgDet&rs=1'),
                    Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 25,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star_purple500_outlined,
                                  color: Colors.red,
                                ),
                                Text('${widget.rate}/5'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Rs. ${widget.price}/-',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Room ${widget.roomNo}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                height: 110,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    const Expanded(
                        child: Text(
                            'A/C available,Bathroom, TV, Food Provided, Swimming pool, Drinks and snack provide, Special package Room.')),
                  ],
                ),
              ),
              Container(
                height: 20,
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 30,
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Check-In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Check-Out',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                width: width * 100,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await _selectDate(context, 1);
                        if (_selectedDateIn != null) {
                          dayIn = _selectedDateIn!.day;
                          monthIn = _selectedDateIn!.month;
                          yearIn = _selectedDateIn!.year;
                        }
                        await _selectTime(context, 1);
                        if (_selectedTimeIn != null) {
                          hoursIn = _selectedTimeIn!.hour;
                          minutsIn = _selectedTimeIn!.minute;
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        height: 60,
                        width: width * 42,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('Date'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('Time'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('$dayIn/$monthIn/$yearIn'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                          '$hoursIn:$minutsIn ${hoursIn >= 12 ? "PM" : "AM"}'),
                                      // hours>=12?
                                      // :Text('${hours/2}:$minuts AM'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        await _selectDate(context, 2);
                        if (_selectedDateOut != null) {
                          dayOut = _selectedDateOut!.day;
                          monthOut = _selectedDateOut!.month;
                          yearOut = _selectedDateOut!.year;
                        }
                        await _selectTime(context, 2);
                        if (_selectedTimeOut != null) {
                          hoursOut = _selectedTimeOut!.hour;
                          minutsOut = _selectedTimeOut!.minute;
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        height: 60,
                        width: width * 42,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('Date'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('Time'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('$dayOut/$monthOut/$yearOut'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                          '$hoursOut:$minutsOut ${hoursOut >= 12 ? "PM" : "AM"}'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(
                  left: 30,
                ),
                child: const Text(
                  'Guest Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  color: Colors.white,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                height: 20,
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 30,
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Phone No',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Payment',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                width: width * 100,
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      height: 40,
                      width: width * 42,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      height: 40,
                      width: width * 42,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 30,
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ID Proof',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                width: width * 100,
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      height: 40,
                      width: width * 42,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Booking Confirm',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
