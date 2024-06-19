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
  [40, 'Food', const Color.fromRGBO(177, 113, 246, 1.0)],
  [60, "Rest", const Color(0XFFBBBBBB)],
  [70, 'Household', const Color.fromRGBO(30, 192, 206, 1.0)],
  [30, "Rest", const Color(0XFFBBBBBB)],
  [40, 'Health', const Color.fromRGBO(203, 179, 245, 1.0)],
  [60, "Rest", const Color(0XFFBBBBBB)],
  [35, 'Education', const Color.fromRGBO(218, 213, 118, 1.0)],
  [65, "Rest", const Color(0XFFBBBBBB)],
  [6, 'Transportation', const Color.fromRGBO(134, 187, 26, 1.0)],
  [94, "Rest", const Color(0XFFBBBBBB)],
  [50, 'Pets', const Color.fromRGBO(26, 147, 68, 1.0)],
  [50, "Rest", const Color(0XFFBBBBBB)],
  [45, 'Beauty', const Color.fromRGBO(63, 143, 208, 1.0)],
  [55, "Rest", const Color(0XFFBBBBBB)],
  [92, 'Apparel', const Color.fromRGBO(201, 141, 92, 1.0)],
  [8, "Rest", const Color(0XFFBBBBBB)],
  [40, 'Electronics and Appliances', const Color.fromRGBO(203, 120, 142, 1.0)],
  [60, "Rest", const Color(0XFFBBBBBB)],
  [35, 'Social Life', const Color.fromRGBO(50, 196, 162, 1.0)],
  [65, "Rest", const Color(0XFFBBBBBB)],
  [7, 'Others', const Color.fromRGBO(239, 171, 250, 1.0)],
  [93, "Rest", const Color(0XFFBBBBBB)],
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              left: 10,
              top: MediaQuery.of(context).padding.top +
                  12, // Add margin from the app bar
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.95, // Increase width of the container
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kNewAppBarColor,
                      kGradientChange,
                    ],
                    stops: [0.35, 1],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      // Example color for the profile icon
                      child: Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aavash Lamichhane',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Rs. 6500',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Available Balance',
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 125,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
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
                            color: kNewAppBarColor,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Send Money Button
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
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          kNewAppBarColor),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(100, 100)),
                                ),
                                child: const Column(
                                  children: [
                                    Icon(
                                      CupertinoIcons.money_dollar_circle,
                                      size: 26,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 4),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: 'Send\n'),
                                          TextSpan(text: 'Money'),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 18),
                              // Add Income Button
                              ElevatedButton(
                                onPressed: () {
                                  // Implement onPressed for Add Income button
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          kNewAppBarColor),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(100, 100)),
                                ),
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.wallet_outlined,
                                      size: 26,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 4),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: 'Add\n'),
                                          TextSpan(text: 'Income'),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 18),
                              // Add Expense Button
                              ElevatedButton(
                                onPressed: () {
                                  // Implement onPressed for Add Expense button
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          kNewAppBarColor),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(100, 100)),
                                ),
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.add_circle_outline,
                                      size: 26,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 4),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: 'Add\n'),
                                          TextSpan(text: 'Expense'),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ],
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
                            color: kActiveIconColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Food",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.3000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Household",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.4000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Education",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.42000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Transportation",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.400",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Pets",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.4000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Beauty",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.4000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Health",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.4000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Apparel",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.4000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Electronics and Appliances",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.4000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Social Life",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.1000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF80bce8), // Starting color
                                    Color(0xFFb8dffc), // Lighter shade
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            height: 215,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Others",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
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
                                                color: kNewAppBarColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Out of Rs.4000",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kNewAppBarColor,
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
