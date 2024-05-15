import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tranzac/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List Data = [
  [40, 'Food', Color.fromRGBO(211, 107, 159, 1.0)],
  [60, "Rest", Color(0XFFBBBBBB)],
  [40, 'Shopping', Color.fromRGBO(202, 73, 140, 1.0)],
  [60, "Rest", Color(0XFFBBBBBB)],
  [35, 'Education', Color.fromRGBO(185, 119, 172, 1.0)],
  [65, "Rest", Color(0XFFBBBBBB)],
  [6, 'Transportation', Color.fromRGBO(230, 191, 206, 1.0)],
  [94, "Rest", Color(0XFFBBBBBB)],
  [17, 'Entertainment', Color.fromRGBO(241, 164, 230, 1.0)],
  [4, 'Others', Color.fromRGBO(207, 155, 189, 1.0)],
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned(
              left: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 400,
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: const Text(
                        'Aavash Lamichhane',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text(
                        'Rs.xxxx',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text(
                        'Available Balance',
                        style: TextStyle(color: klightTextColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 120,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kSecondBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                      width: 300,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: Icon(
                              Icons.access_alarm_rounded,
                              size: 40,
                              color: kSecondBackgroundColor,
                            ),
                          ),
                          Text(
                            'Send Money',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: const Text(
                        'Expenses',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: kLightGreyColor,
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 220,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Food & Drinks",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kSecondBackgroundColor,
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Container(
                                    height: 120,
                                    width: 300,
                                    child: SfCircularChart(
                                      series: [
                                        DoughnutSeries(
                                          dataSource: Data.sublist(0, 2),
                                          yValueMapper: (data, _) => data[0],
                                          xValueMapper: (data, _) => data[1],
                                          radius: '70%',
                                          innerRadius: '85%',
                                          explode: true,
                                          pointColorMapper: (data, _) =>
                                              data[2],
                                          // dataLabelMapper: (data, _) =>
                                          //     data[0].toString() + ' %',
                                          // dataLabelSettings: DataLabelSettings(
                                          //     isVisible: true),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 05, 90, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rs.1200 left",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: kSecondBackgroundColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "out of 2000",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: kLightGreyColor,
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 220,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Shopping",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kSecondBackgroundColor,
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Container(
                                    height: 120,
                                    width: 300,
                                    child: SfCircularChart(
                                      series: [
                                        DoughnutSeries(
                                          dataSource: Data.sublist(1, 3),
                                          yValueMapper: (data, _) => data[0],
                                          xValueMapper: (data, _) => data[1],
                                          radius: '70%',
                                          innerRadius: '85%',
                                          explode: true,
                                          pointColorMapper: (data, _) =>
                                              data[2],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 05, 90, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rs.1200 left",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: kSecondBackgroundColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "out of 2000",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
