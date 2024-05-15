import 'package:flutter/material.dart';

class SettleUp extends StatelessWidget {
  const SettleUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF024578),
        foregroundColor: Colors.white,
        title: const Center(child: Text("SETTLE UP")),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xFF024578),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Jane Doe",
                          style: TextStyle(fontSize: 30),
                        ),
                        const Text(
                          "You owe Rs 300",
                          style: TextStyle(color: Colors.red),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Settle Up",
                              style: TextStyle(color: Color(0xFF024578)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("March 21"),
                    lt("Lunch", "You owe Jane Rs 300"),
                    const Text("March 19"),
                    lt("Lunch", "Jane owes you Rs 300"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget lt(String x, String y) {
  return ListTile(
    tileColor: const Color(0xFF024578),
    textColor: Colors.white,
    title: Text(x),
    subtitle: Text(y),
  );
}
