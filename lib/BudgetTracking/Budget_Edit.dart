import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranzac/constants.dart';

class Budget_Edit extends StatefulWidget {
  const Budget_Edit({super.key});

  @override
  State<Budget_Edit> createState() => _Budget_EditState();
}

class _Budget_EditState extends State<Budget_Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kNewAppBarColor,
        elevation: 0,
        title: const Text(
          'Edit Budget',
          style: TextStyle(
            color: kActiveIconColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
