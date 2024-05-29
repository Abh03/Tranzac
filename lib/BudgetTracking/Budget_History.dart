import 'package:flutter/material.dart';

class Budget_History extends StatefulWidget {
  const Budget_History({super.key});

  @override
  State<Budget_History> createState() => _Budget_HistoryState();
}

List chartData = [
  [20, 'Rent', const Color.fromRGBO(202, 73, 140, 1.0)],
  [18, 'Food', const Color.fromRGBO(211, 107, 159, 1.0)],
  [35, 'Education', const Color.fromRGBO(185, 119, 172, 1.0)],
  [6, 'Transportation', const Color.fromRGBO(230, 191, 206, 1.0)],
  [17, 'Entertainment', const Color.fromRGBO(241, 164, 230, 1.0)],
  [4, 'Others', const Color.fromRGBO(207, 155, 189, 1.0)],
];

class _Budget_HistoryState extends State<Budget_History> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
