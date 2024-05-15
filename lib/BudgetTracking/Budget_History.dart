import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Budget_History extends StatefulWidget {
  const Budget_History({super.key});

  @override
  State<Budget_History> createState() => _Budget_HistoryState();
}

List chartData = [
  [20, 'Rent', Color.fromRGBO(202, 73, 140, 1.0)],
  [18, 'Food', Color.fromRGBO(211, 107, 159, 1.0)],
  [35, 'Education', Color.fromRGBO(185, 119, 172, 1.0)],
  [6, 'Transportation', Color.fromRGBO(230, 191, 206, 1.0)],
  [17, 'Entertainment', Color.fromRGBO(241, 164, 230, 1.0)],
  [4, 'Others', Color.fromRGBO(207, 155, 189, 1.0)],
];

class _Budget_HistoryState extends State<Budget_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
