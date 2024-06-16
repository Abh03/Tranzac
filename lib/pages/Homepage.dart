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
  [40, 'Food', const Color.fromRGBO(71, 154, 161, 1.0)],
  [60, "Rest", const Color(0XFFBBBBBB)],
  [70, 'Household', const Color.fromRGBO(121, 220, 241, 1.0)],
  [30, "Rest", const Color(0XFFBBBBBB)],
  [40, 'Health', const Color.fromRGBO(14, 209, 238, 1.0)],
  [60, "Rest", const Color(0XFFBBBBBB)],
  [35, 'Education', const Color.fromRGBO(96, 211, 211, 1.0)],
  [65, "Rest", const Color(0XFFBBBBBB)],
  [6, 'Transportation', const Color.fromRGBO(148, 214, 224, 1.0)],
  [94, "Rest", const Color(0XFFBBBBBB)],
  [50, 'Pets', const Color.fromRGBO(14, 89, 101, 1.0)],
  [50, "Rest", const Color(0XFFBBBBBB)],
  [45, 'Beauty', const Color.fromRGBO(127, 189, 197, 1.0)],
  [55, "Rest", const Color(0XFFBBBBBB)],
  [92, 'Apparel', const Color.fromRGBO(17, 111, 140, 1.0)],
  [8, "Rest", const Color(0XFFBBBBBB)],
  [40, 'Electronics and Appliances', const Color.fromRGBO(1, 72, 100, 1.0)],
  [60, "Rest", const Color(0XFFBBBBBB)],
  [35, 'Social Life', const Color.fromRGBO(49, 136, 162, 1.0)],
  [65, "Rest", const Color(0XFFBBBBBB)],
  [7, 'Others', const Color.fromRGBO(36, 196, 190, 1.0)],
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
                child: Row(
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
                          style:
                              TextStyle(color: klightTextColor, fontSize: 16),
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
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          kNewAppBarColor),
                                ),
                                child: const Text(
                                  'Send Money',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 10),
                              // Adjust spacing between buttons
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Implement onPressed for Add Expense button
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          kNewAppBarColor),
                                ),
                                icon: Icon(Icons.add, size: 28, color: Colors.white,),
                                label: Text(
                                  'Add Expense',
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
                            color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Household",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Pets",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Beauty",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Health",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Apparel",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Electronics and Appliances",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Social Life",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
                                    Color(0xFFa5d5fa), // Lighter shade
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Others",
                                            style: TextStyle(
                                                color: kNewAppBarColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kNewAppBarColor,
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
