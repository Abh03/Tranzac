import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tranzac/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranzac/pages/sendmoney.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List Data = [
  [40, 'Food', const Color.fromRGBO(211, 107, 159, 1.0)],
  [60, "Rest", const Color(0XFFBBBBBB)],
  [40, 'Shopping', const Color.fromRGBO(202, 73, 140, 1.0)],
  [60, "Rest", const Color(0XFFBBBBBB)],
  [35, 'Education', const Color.fromRGBO(185, 119, 172, 1.0)],
  [65, "Rest", const Color(0XFFBBBBBB)],
  [6, 'Transportation', const Color.fromRGBO(230, 191, 206, 1.0)],
  [94, "Rest", const Color(0XFFBBBBBB)],
  [17, 'Entertainment', const Color.fromRGBO(241, 164, 230, 1.0)],
  [4, 'Others', const Color.fromRGBO(207, 155, 189, 1.0)],
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: kLightGreyColor,
        body: Stack(
          children: [
            Positioned(
              left: 10,
              top: MediaQuery.of(context).padding.top + 12, // Add margin from the app bar
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.95, // Increase width of the container
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kActiveIconColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      // Example color for the profile icon
                      child: Icon(Icons.person, color: Colors.white, size: 50),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aavash Lamichhane',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Rs. 6500',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Available Balance',
                          style:
                              TextStyle(color: klightTextColor, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 160,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kLightGreyColor,
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: kActiveIconColor,
                            // Background color of the container
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                CupertinoIcons.money_dollar_circle,
                                size: 28,
                                color: Colors.white,
                              ),
                              SizedBox(width: 2),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SendMoney()),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(kActiveIconColor),
                                ),
                                child: const Text(
                                  'Send Money',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                      child: Text(
                        'Expenses',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
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
                                          const Text(
                                            "Food",
                                            style: TextStyle(
                                                color: kActiveIconColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kActiveIconColor,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  SizedBox(
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 05, 90, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rs.800 left",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.3000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
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
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
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
                                          const Text(
                                            "Rent",
                                            style: TextStyle(
                                                color: kActiveIconColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kActiveIconColor,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  SizedBox(
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
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 05, 90, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rs.120 left",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.4000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
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
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
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
                                          const Text(
                                            "Education",
                                            style: TextStyle(
                                                color: kActiveIconColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kActiveIconColor,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    width: 300,
                                    child: SfCircularChart(
                                      series: [
                                        DoughnutSeries(
                                          dataSource: Data.sublist(4, 6),
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
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 05, 90, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rs.0 left",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.42000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
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
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
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
                                          const Text(
                                            "Transportation",
                                            style: TextStyle(
                                                color: kActiveIconColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kActiveIconColor,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    width: 300,
                                    child: SfCircularChart(
                                      series: [
                                        DoughnutSeries(
                                          dataSource: Data.sublist(6, 8),
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
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 05, 90, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rs.100 left",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.400",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
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
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
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
                                          const Text(
                                            "Entertainment",
                                            style: TextStyle(
                                                color: kActiveIconColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kActiveIconColor,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    width: 300,
                                    child: SfCircularChart(
                                      series: [
                                        DoughnutSeries(
                                          dataSource: Data.sublist(8, 10),
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
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 05, 90, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rs.150 left",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.1000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kActiveIconColor,
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
