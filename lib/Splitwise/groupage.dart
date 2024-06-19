import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/constants.dart';

final user = FirebaseAuth.instance;
final collref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Groups');

class Groupage extends StatelessWidget {
  final group;
  const Groupage({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kNewAppBarColor,
        foregroundColor: Colors.white,
        title: const Text("SPLIT"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Column(
                      children: [
                        Text(
                          group,
                          style: const TextStyle(fontSize: 25),
                        ),
                        // const Text(
                        //   "You owe Rs 300",
                        //   style: TextStyle(color: Colors.red),
                        // ),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFF024578)),
                              foregroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Settle Up",
                            ))
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: StreamBuilder(
                    stream:
                        collref.doc(group).collection('Friends').snapshots(),
                    builder: (context, snapshots) {
                      if (snapshots.connectionState == ConnectionState.active) {
                        if (snapshots.hasData) {
                          return ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              itemCount: snapshots.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Color(0xff024578),
                                  child: ListTile(
                                    textColor: Colors.white,
                                    leading: Icon(
                                      Icons.money,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      "${snapshots.data!.docs[index]["Remarks"]} (${snapshots.data!.docs[index]["Type"]})",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    subtitle: Text(
                                        "${snapshots.data!.docs[index]["DateTime"]}"),
                                    trailing: Text(
                                      "RS ${snapshots.data!.docs[index]["Amount"]}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                );
                              });
                        } else if (snapshots.hasError) {
                          return Center(
                            child: Text(snapshots.hasError.toString()),
                          );
                        } else {
                          return const Center(
                            child: Text("No history"),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff024578),
                          ),
                        );
                      }
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
