import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final user = FirebaseAuth.instance;
final collref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Friends');

class SettleUp extends StatelessWidget {
  final friend;
  SettleUp({super.key, required this.friend});

  final amt = TextEditingController();
  final rmk = TextEditingController();
  final typ = TextEditingController();

  void dispose() {
    amt.dispose();
    rmk.dispose();
    typ.dispose();
  }

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
                            friend,
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
                      stream: collref
                          .doc(friend)
                          .collection('Expenses')
                          .snapshots(),
                      builder: (context, snapshots) {
                        if (snapshots.connectionState ==
                            ConnectionState.active) {
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
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: const Color(0xff024578),
            foregroundColor: Colors.white,
            icon: const Icon(Icons.playlist_add),
            label: const Text("Add expenses"),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: ((context) => AlertDialog(
                        title: const Center(
                          child: Text("Add expenses"),
                        ),
                        actionsPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        actions: [
                          DropdownMenu(
                              controller: typ,
                              width: MediaQuery.sizeOf(context).width * 0.75,
                              inputDecorationTheme: const InputDecorationTheme(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              hintText: "Select type",
                              label: const Text("Type"),
                              dropdownMenuEntries: const <DropdownMenuEntry<
                                  String>>[
                                DropdownMenuEntry(
                                    value: "Borrowed", label: "Borrowed"),
                                DropdownMenuEntry(
                                    value: "Lent", label: "Lent")
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: amt,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hoverColor: Color(0xFF024578),
                                hintText: "Enter amount",
                                labelText: "Amount",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: rmk,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hoverColor: Color(0xFF024578),
                                hintText: "Enter remarks",
                                labelText: "Remarks",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => const Color(0xFF024578)),
                                  foregroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                ),
                                onPressed: () {
                                  collref
                                      .doc(friend)
                                      .collection('Expenses')
                                      .doc('${DateTime.now()}')
                                      .set({
                                    'Amount': amt.text.trim(),
                                    'Remarks': rmk.text.trim(),
                                    'Type': typ.text.trim(),
                                    'DateTime': DateFormat('yyyy-MM-dd HH:mm a')
                                        .format(DateTime.now())
                                        .toString()
                                  }).whenComplete(() {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Center(
                                          child: Text(
                                              "Expense added successfully",
                                              style: TextStyle(
                                                  fontFamily: 'FiraSans'))),
                                      duration: Duration(seconds: 3),
                                    ));
                                  }).then((value) => Navigator.pop(context));
                                },
                                icon: const Icon(Icons.add),
                                label: const Text("Add")),
                          )
                        ],
                      )));
            }));
  }
}
