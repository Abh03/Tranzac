import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranzac/constants.dart';

// Replace with your actual constants.dart file or define kBackgroundColor and kActiveIconColor here
const Color kBackgroundColor = Color(0xFFE5E5E5);
const Color kActiveIconColor = Colors.black;

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

List chartData = [
  [20, 'Rent', const Color.fromRGBO(202, 73, 140, 1.0)],
  [18, 'Food', const Color.fromRGBO(211, 107, 159, 1.0)],
  [35, 'Education', const Color.fromRGBO(185, 119, 172, 1.0)],
  [6, 'Transportation', const Color.fromRGBO(230, 191, 206, 1.0)],
  [17, 'Entertainment', const Color.fromRGBO(241, 164, 230, 1.0)],
  [4, 'Others', const Color.fromRGBO(207, 155, 189, 1.0)],
];

class _BudgetState extends State<Budget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<PieChartSectionData> getSections() {
    return chartData.map((data) {
      return PieChartSectionData(
        color: data[2],
        value: data[0].toDouble(),
        title: '${data[0]}%',
        titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
        radius: 70,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(
          'My Expenses',
          style: TextStyle(
            color: kActiveIconColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF024578),
                    Color(0xFF2a74ad),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet, color: Colors.white),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Remaining Budget',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rs. 4000',
                                style: TextStyle(color: Colors.green, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.money_dollar_circle, color: Colors.white, size: 28),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Total Budget',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rs. 18000',
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2), // Space between My Expenses header and TabBar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: const Color(0xFF024578),
                unselectedLabelColor: Colors.black,
                indicatorColor: const Color(0xFF024578),
                tabs: const [
                  Tab(
                    text: 'Weekly',
                  ),
                  Tab(
                    text: 'Monthly',
                  ),
                  Tab(
                    text: 'Yearly',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5), // Space between TabBar and PieChart
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.38,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildPieChart(),
                  _buildPieChart(),
                  _buildPieChart(),
                ],
              ),
            ),
            const SizedBox(height: 10), // Space between PieChart and Legend container
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Legend',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kActiveIconColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: [
                      for (var data in chartData)
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              color: data[2],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              data[1],
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${data[0]}%',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Space below Legend container
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: getSections(),
        centerSpaceRadius: 50,
        sectionsSpace: 2,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Budget(),
  ));
}
