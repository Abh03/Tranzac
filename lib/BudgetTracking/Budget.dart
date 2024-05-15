import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

List chartData = [
  [20, 'Rent', Color.fromRGBO(202, 73, 140, 1.0)],
  [18, 'Food', Color.fromRGBO(211, 107, 159, 1.0)],
  [35, 'Education', Color.fromRGBO(185, 119, 172, 1.0)],
  [6, 'Transportation', Color.fromRGBO(230, 191, 206, 1.0)],
  [17, 'Entertainment', Color.fromRGBO(241, 164, 230, 1.0)],
  [4, 'Others', Color.fromRGBO(207, 155, 189, 1.0)],
];

class _BudgetState extends State<Budget> {
  late SelectionBehavior _selectionBehavior;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7DEE8),
      body: Stack(
        children: [
// Container
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            height: MediaQuery.of(context).size.height * 0.18,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3C6E98),
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
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '01 January 2024',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Rs. 4000 left',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Out of Rs. 18000 budget',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 10,
            child: const Text(
              'Categories',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
// Doughnut chart
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            bottom: 30,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SfCircularChart(
                margin: EdgeInsets.all(0),
                series: [
                  DoughnutSeries(
                    dataSource: chartData,
                    yValueMapper: (data, _) => data[0],
                    xValueMapper: (data, _) => data[1],
                    radius: '70%',
                    innerRadius: '45%',
                    explode: true,
                    pointColorMapper: (data, _) => data[2],
                    dataLabelMapper: (data, _) => data[0].toString() + ' %',
                    dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(fontSize: 12, color: Colors.white),
                        labelPosition: ChartDataLabelPosition.inside),
                  )
                ],
              ),
            ),
          ),
// Legend Container
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // Adjust spacing between rows
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: [
                        for (var data in chartData
                            .take(chartData.length ~/ 2)) // First half
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
                        for (var data in chartData
                            .skip(chartData.length ~/ 2)) // Second half
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
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
