import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tranzac/constants.dart';
import 'package:flutter/cupertino.dart';

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

class _BudgetState extends State<Budget> {
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

  bool _isWeeklyHovered = false;
  bool _isMonthlyHovered = false;
  bool _isYearlyHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            height: MediaQuery.of(context).size.height * 0.17,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kActiveIconColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'My Expenses',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
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
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: _isWeeklyHovered ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: _buildHoverButton('Weekly', _isWeeklyHovered, () {
                      setState(() {
                        _isWeeklyHovered = !_isWeeklyHovered;
                      });
                    }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: _isMonthlyHovered ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _buildHoverButton('Monthly', _isMonthlyHovered, () {
                      setState(() {
                        _isMonthlyHovered = !_isMonthlyHovered;
                      });
                    }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: _isYearlyHovered ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _buildHoverButton('Yearly', _isYearlyHovered, () {
                      setState(() {
                        _isYearlyHovered = !_isYearlyHovered;
                      });
                    }),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: 0,
            right: 0,
            bottom: 30,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: PieChart(
                PieChartData(
                  sections: getSections(),
                  centerSpaceRadius: 50,
                  sectionsSpace: 2,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: -35,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: [
                        for (var data in chartData.take(chartData.length ~/ 2))
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
                        for (var data in chartData.skip(chartData.length ~/ 2))
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoverButton(String text, bool isHovered, VoidCallback onHover) {
    return MouseRegion(
      onEnter: (_) => onHover(),
      onExit: (_) => onHover(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Budget(),
  ));
}