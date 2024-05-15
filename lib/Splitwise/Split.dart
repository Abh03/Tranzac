import 'package:flutter/material.dart';
import 'package:tranzac/Splitwise/settleup.dart';

class Split extends StatefulWidget {
  const Split({super.key});

  @override
  State<Split> createState() => _SplitState();
}

class _SplitState extends State<Split> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "FRIENDS",
                      style: TextStyle(fontSize: 30),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Add Friends",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text("Jane Doe"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettleUp()));
                        })
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
