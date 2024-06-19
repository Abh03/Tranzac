import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tranzac/Splitwise/groupage.dart';
import 'package:tranzac/Splitwise/settleup.dart';
import 'package:tranzac/constants.dart';

final user = FirebaseAuth.instance;
final collref = FirebaseFirestore.instance.collection('Users');
final friendref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Friends');

final groupref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Groups');

class Splitwise extends StatefulWidget {
  const Splitwise({super.key});

  @override
  State<Splitwise> createState() => _SplitState();
}

class _SplitState extends State<Splitwise> {
  final friendmail = TextEditingController();
  final group = TextEditingController();

  @override
  void dispose() {
    friendmail.dispose();
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
                  indicatorColor: kNewAppBarColor,
                  labelColor: kNewAppBarColor,
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
                                  (states) => kNewAppBarColor),
                              foregroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      scrollable: true,
                                      title: const Center(
                                          child: Text("Add friend")),
                                      actionsPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                      actions: [
                                        TextFormField(
                                          controller: friendmail,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Enter your friend's email",
                                              labelText: "Email",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: ElevatedButton.icon(
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
                                                String eMail =
                                                    friendmail.text.trim();
                                              },
                                              icon: const Icon(Icons.search),
                                              label: const Text("Search")),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        StreamBuilder(
                                            stream: collref
                                                .where("Email",
                                                    isEqualTo:
                                                        friendmail.text.trim())
                                                .snapshots(),
                                            builder: (context, snapshots) {
                                              if (snapshots.connectionState ==
                                                  ConnectionState.active) {
                                                if (snapshots.hasData) {
                                                  return ListView.builder(
                                                      itemCount: snapshots
                                                          .data!.docs.length,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        return ListTile();
                                                      }));
                                                } else if (snapshots.hasError) {
                                                  return Center(
                                                    child: Text(snapshots
                                                        .hasError
                                                        .toString()),
                                                  );
                                                } else {
                                                  return const Center(
                                                    child:
                                                        Text("No user found."),
                                                  );
                                                }
                                              } else {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: kBackgroundColor,
                                                  ),
                                                );
                                              }
                                            }),
                                      ],
                                    ));
                          },
                          icon: const Icon(Icons.person_add_alt_1),
                          label: const Text("Add friends")),
                      const Divider(),
                      Expanded(
                        child: StreamBuilder(
                            stream: friendref.snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                if (snapshot.hasData) {
                                  return ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: const CircleAvatar(
                                          backgroundColor: kNewAppBarColor,
                                          foregroundColor: Colors.white,
                                          child: Icon(Icons.person),
                                        ),
                                        title: Text(
                                            '${snapshot.data!.docs[index]["Name"]}'),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SettleUp(
                                                        friend:
                                                            "${snapshot.data!.docs[index]["Name"]}",
                                                      )));
                                        },
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text(snapshot.hasError.toString()),
                                  );
                                } else {
                                  return const Center(
                                      child: Text(
                                    "Try adding some friends",
                                    style: TextStyle(fontSize: 25),
                                  ));
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
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => kNewAppBarColor),
                              foregroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("Create group"),
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
                                                groupref.doc(group.text).set({
                                                  'Name': group.text.trim()
                                                }).whenComplete(() =>
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
                                                      duration:
                                                          Duration(seconds: 3),
                                                    )));
                                              },
                                              child: const Text("Create")),
                                        ),
                                        StreamBuilder(
                                            stream: friendref.snapshots(),
                                            builder: (context, snapshots) {
                                              if (snapshots.connectionState ==
                                                  ConnectionState.active) {
                                                if (snapshots.hasData) {
                                                  return ListView.builder(
                                                      itemCount: snapshots
                                                          .data!.docs.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return ListTile(
                                                          title: snapshots.data!
                                                                  .docs[index]
                                                              ["Name"],
                                                        );
                                                      });
                                                } else if (snapshots.hasError) {
                                                  return Center(
                                                    child: Text(snapshots
                                                        .hasError
                                                        .toString()),
                                                  );
                                                } else {
                                                  return const Center(
                                                    child: Text("No data"),
                                                  );
                                                }
                                              } else {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: kNewAppBarColor,
                                                  ),
                                                );
                                              }
                                            })
                                      ],
                                    ));
                          },
                          icon: const Icon(Icons.group_add),
                          label: const Center(child: Text("Create group"))),
                      const Divider(),
                      Expanded(
                        child: StreamBuilder(
                            stream: groupref.snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                if (snapshot.hasData) {
                                  return ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: const CircleAvatar(
                                          backgroundColor: kNewAppBarColor,
                                          foregroundColor: Colors.white,
                                          child: Icon(Icons.groups),
                                        ),
                                        title: Text(
                                            '${snapshot.data!.docs[index]["Name"]}'),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      Groupage(
                                                        group:
                                                            "${snapshot.data!.docs[index]["Name"]}",
                                                      ))));
                                        },
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text(snapshot.hasError.toString()),
                                  );
                                } else {
                                  return const Center(
                                      child: Text(
                                    "Try creating a group",
                                    style: TextStyle(fontSize: 25),
                                  ));
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
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
