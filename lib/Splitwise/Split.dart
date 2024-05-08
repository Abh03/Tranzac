import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Split extends StatefulWidget {
  const Split({super.key});

  @override
  State<Split> createState() => _SplitState();
}

class _SplitState extends State<Split> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splitwise"),
      ),
    );
  }
}
