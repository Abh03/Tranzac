import 'package:flutter/material.dart';
import 'package:tranzac/constants.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kLightGreyColor,
      body: Stack(
        children: [
          Positioned(
            left: 10,
            top: MediaQuery.of(context).padding.top + 12,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: kActiveIconColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10),
                const Text(
                  'Send Money',
                  style: TextStyle(
                    color: kActiveIconColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            top: MediaQuery.of(context).padding.top + 70,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kActiveIconColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white, size: 50),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aavash Lamichhane',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rs. 6500',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Available Balance',
                        style: TextStyle(color: klightTextColor, fontSize: 18),
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
