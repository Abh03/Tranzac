import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/constants.dart';

final user = FirebaseAuth.instance;
final collref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Groups');

class Groupage extends StatefulWidget {
  final String group;
  const Groupage({super.key, required this.group});

  @override
  _GroupageState createState() => _GroupageState();
}

class _GroupageState extends State<Groupage> {
  void _addExpense(String memberId) async {
    String? remarks;
    String? type;
    double? amount;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Remarks'),
                onChanged: (value) => remarks = value,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Type'),
                onChanged: (value) => type = value,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) => amount = double.tryParse(value),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (remarks != null && type != null && amount != null) {
                  collref
                      .doc(widget.group)
                      .collection('Members')
                      .doc(memberId)
                      .collection('Expenses')
                      .add({
                    'Remarks': remarks,
                    'Type': type,
                    'Amount': amount,
                    'DateTime': DateTime.now().toString(),
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

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
                      backgroundColor: kActiveIconColor,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          widget.group,
                          style: const TextStyle(fontSize: 25),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all(kActiveIconColor),
                          ),
                          onPressed: () {},
                          child: const Text("Settle Up"),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: StreamBuilder(
                  stream: collref.doc(widget.group).collection('Members').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                    if (snapshots.connectionState == ConnectionState.active) {
                      if (snapshots.hasData) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            var member = snapshots.data!.docs[index];
                            return Card(
                              color: kActiveIconColor,
                              child: ExpansionTile(
                                title: Text(
                                  member.id,
                                  style: const TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                leading: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                children: [
                                  StreamBuilder(
                                    stream: collref
                                        .doc(widget.group)
                                        .collection('Members')
                                        .doc(member.id)
                                        .collection('Expenses')
                                        .snapshots(),
                                    builder: (context, AsyncSnapshot<QuerySnapshot> expenseSnapshots) {
                                      if (expenseSnapshots.connectionState == ConnectionState.active) {
                                        if (expenseSnapshots.hasData) {
                                          return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: expenseSnapshots.data!.docs.length,
                                            itemBuilder: (context, expenseIndex) {
                                              var expense = expenseSnapshots.data!.docs[expenseIndex];
                                              return ListTile(
                                                title: Text(expense['Remarks'], style: const TextStyle(color: Colors.white)),
                                                subtitle: Text(expense['DateTime'], style: const TextStyle(color: Colors.white)),
                                                trailing: Text('RS ${expense['Amount']}', style: const TextStyle(color: Colors.white)),
                                              );
                                            },
                                          );
                                        } else {
                                          return const Text("No expenses found", style: TextStyle(color: Colors.white));
                                        }
                                      } else {
                                        return const CircularProgressIndicator(color: Colors.white);
                                      }
                                    },
                                  ),
                                  TextButton(
                                    onPressed: () => _addExpense(member.id),
                                    child: const Text('Add Expense', style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (snapshots.hasError) {
                        return Center(
                          child: Text(snapshots.hasError.toString()),
                        );
                      } else {
                        return const Center(
                          child: Text("No members found"),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kActiveIconColor,
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kActiveIconColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Select Member'),
                content: StreamBuilder(
                  stream: collref.doc(widget.group).collection('Members').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                    if (snapshots.connectionState == ConnectionState.active) {
                      if (snapshots.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            var member = snapshots.data!.docs[index];
                            return ListTile(
                              title: Text(member.id),
                              onTap: () {
                                Navigator.of(context).pop();
                                _addExpense(member.id);
                              },
                            );
                          },
                        );
                      } else if (snapshots.hasError) {
                        return Center(
                          child: Text(snapshots.hasError.toString()),
                        );
                      } else {
                        return const Center(
                          child: Text("No members found"),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kActiveIconColor,
                        ),
                      );
                    }
                  },
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
