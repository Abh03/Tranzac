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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD7DEE8),
      body: Stack(
        children: [
          // Container
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3C6E98),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Expenses',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2 + 10,
            left: 10,
            right: 10,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categories',
                style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Doughnut chart
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SfCircularChart(
                margin: const EdgeInsets.all(0),
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
                        textStyle: TextStyle(
                            fontSize: 12, color: Colors.white),
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
            top: MediaQuery.of(context).size.height * 0.65,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var data in chartData)
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          color: data[2],
                        ),
                        SizedBox(width: 8),
                        Text(
                          data[1],
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '${data[0]}%',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



