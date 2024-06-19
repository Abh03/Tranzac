import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/Splitwise/Split.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/pages/Abstract.dart';

final user = FirebaseAuth.instance;
final friendref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Friends');

final groupref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Groups');

class Addfriends extends StatelessWidget {
  final group;
  const Addfriends({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kNewAppBarColor,
        foregroundColor: Colors.white,
        title: const Center(child: Text("ADD FRIENDS")),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: StreamBuilder(
                    stream: friendref.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                trailing: TextButton(
                                    onPressed: () {
                                      groupref
                                          .doc(group)
                                          .collection('Members')
                                          .doc(
                                              '${snapshot.data!.docs[index]["Name"]}')
                                          .set({});
                                    },
                                    child: const Text(
                                      "ADD",
                                      style: TextStyle(color: kNewAppBarColor),
                                    )),
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
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: kNewAppBarColor,
        child: Center(
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Done",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ),
      ),
    );
  }
}
