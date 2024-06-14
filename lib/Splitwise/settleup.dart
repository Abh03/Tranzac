import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final user = FirebaseAuth.instance;
final collref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Friends');

class SettleUp extends StatelessWidget {
  final friend;
  const SettleUp({super.key, required this.friend});

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
                          Text(
                            friend,
                            style: const TextStyle(fontSize: 30),
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
                const Divider(),
                const Column(
                  children: [],
                )
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: const Color(0xff024578),
            foregroundColor: Colors.white,
            icon: const Icon(Icons.playlist_add),
            label: const Text("Add expenses"),
            onPressed: () {}));
  }
}
