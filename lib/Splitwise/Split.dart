import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/Splitwise/settleup.dart';

final user = FirebaseAuth.instance;
final friendref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Friends');

final groupref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Groups');

class Split extends StatefulWidget {
  const Split({super.key});

  @override
  State<Split> createState() => _SplitState();
}

class _SplitState extends State<Split> {
  final friend = TextEditingController();
  final group = TextEditingController();

  @override
  void dispose() {
    friend.dispose();
    group.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              const TabBar(
                  indicatorColor: Color(0xFF024578),
                  labelColor: Color(0xFF024578),
                  tabs: [
                    Tab(
                      icon: Icon(Icons.person),
                      text: "Friends",
                    ),
                    Tab(
                      icon: Icon(Icons.groups),
                      text: "Groups",
                    )
                  ]),
              Expanded(
                child: TabBarView(children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFF024578)),
                              foregroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      actionsPadding: const EdgeInsets.all(10),
                                      actions: [
                                        TextFormField(
                                          controller: friend,
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Enter your friend's name",
                                              labelText: "Name",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateColor
                                                          .resolveWith((states) =>
                                                              const Color(
                                                                  0xFF024578)),
                                                  foregroundColor:
                                                      MaterialStateColor
                                                          .resolveWith(
                                                              (states) => Colors
                                                                  .white)),
                                              onPressed: () {
                                                friendref
                                                    .doc(friend.text)
                                                    .set({
                                                      'Name': friend.text.trim()
                                                    })
                                                    .whenComplete(() =>
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                          backgroundColor:
                                                              Colors.green,
                                                          content: Center(
                                                              child: Text(
                                                                  "Added successfully",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'FiraSans'))),
                                                          duration: Duration(
                                                              seconds: 3),
                                                        )))
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                              },
                                              child: const Text("Add")),
                                        )
                                      ],
                                    ));
                          },
                          icon: const Icon(Icons.add_circle),
                          label: const Text("Add friends")),
                      const Divider(),
                      Expanded(
                        child: StreamBuilder(
                            stream: friendref.snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: const Icon(Icons.person),
                                      title: Text(
                                          '${snapshot.data!.docs[index]["Name"]}'),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SettleUp()));
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                );
                              } else {
                                return const Center(
                                    child: Text(
                                  "Try adding some friends",
                                  style: TextStyle(fontSize: 25),
                                ));
                              }
                            }),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFF024578)),
                              foregroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      actionsPadding: const EdgeInsets.all(10),
                                      actions: [
                                        TextFormField(
                                          controller: group,
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Enter your group's name",
                                              labelText: "Name",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateColor
                                                          .resolveWith((states) =>
                                                              const Color(
                                                                  0xFF024578)),
                                                  foregroundColor:
                                                      MaterialStateColor
                                                          .resolveWith(
                                                              (states) => Colors
                                                                  .white)),
                                              onPressed: () {
                                                groupref
                                                    .doc(group.text)
                                                    .set({
                                                      'Name': group.text.trim()
                                                    })
                                                    .whenComplete(() =>
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                          backgroundColor:
                                                              Colors.green,
                                                          content: Center(
                                                              child: Text(
                                                                  "Added successfully",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'FiraSans'))),
                                                          duration: Duration(
                                                              seconds: 3),
                                                        )))
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                              },
                                              child: const Text("Add")),
                                        )
                                      ],
                                    ));
                          },
                          icon: const Icon(Icons.add_circle),
                          label: const Text("Create group")),
                      const Divider(),
                      Expanded(
                        child: StreamBuilder(
                            stream: groupref.snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: const Icon(Icons.groups),
                                      title: Text(
                                          '${snapshot.data!.docs[index]["Name"]}'),
                                      onTap: () {
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                );
                              } else {
                                return const Center(
                                    child: Text(
                                  "Try creating a group",
                                  style: TextStyle(fontSize: 25),
                                ));
                              }
                            }),
                      )
                    ],
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
