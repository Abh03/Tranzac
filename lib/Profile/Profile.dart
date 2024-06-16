import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/pages/login.dart';
import 'package:tranzac/constants.dart';

final user = FirebaseAuth.instance;
final collref = FirebaseFirestore.instance.collection('Users');

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assests/images/splash2.png'),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${user.currentUser!.displayName}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 1),
                Text(
                  '${user.currentUser!.phoneNumber}',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(height: 1),
                Text(
                  '${user.currentUser!.email}',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: kNewAppBarColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.money,
                                color: Colors.white,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Balance',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Rs. 3500.00',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(thickness: 1, color: Colors.grey),
                const SizedBox(height: 15),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: kNewAppBarColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: StreamBuilder(
                        stream: collref
                            .where("Email", isEqualTo: user.currentUser!.email)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: const Text('DOB',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(
                                              '${snapshot.data!.docs[index]["Date of birth"]}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                          leading: const Icon(
                                              CupertinoIcons.calendar,
                                              color: Colors.white,
                                              size: 28),
                                        ),
                                        const Divider(),
                                        ListTile(
                                          title: const Text('Occupation',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(
                                              '${snapshot.data!.docs[index]["Occupation"]}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                          leading: const Icon(
                                              CupertinoIcons.bag,
                                              color: Colors.white,
                                              size: 28),
                                        ),
                                        const Divider(),
                                        ListTile(
                                          title: const Text('Gender',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(
                                              '${snapshot.data!.docs[index]["Gender"]}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                          leading: const Icon(
                                              LineAwesome.mars_solid,
                                              color: Colors.white,
                                              size: 28),
                                        ),
                                        const Divider(),
                                        ListTile(
                                          title: const Text('Address',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(
                                              '${snapshot.data!.docs[index]["Address.current"]}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                          leading: const Icon(
                                              CupertinoIcons.map_pin_ellipse,
                                              color: Colors.white,
                                              size: 28),
                                        ),
                                        const Divider(),
                                        const ListTile(
                                          title: Text('Bank Accounts',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(
                                              'Manage your linked bank accounts',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                          leading: Icon(
                                              CupertinoIcons.money_dollar,
                                              color: Colors.white,
                                              size: 28),
                                          trailing: Icon(
                                              CupertinoIcons.arrow_right,
                                              color: Colors.white,
                                              size: 28),
                                        ),
                                        const Divider(),
                                        ListTile(
                                          title: const Text('Log Out',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: const Text(
                                              'Sign out from this device',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                          leading: const Icon(
                                              LineAwesome.sign_out_alt_solid,
                                              color: Colors.white,
                                              size: 28),
                                          onTap: () {
                                            FirebaseAuth.instance
                                                .signOut()
                                                .whenComplete(() =>
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      content: Center(
                                                          child: Text(
                                                              "Logged out successfully",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'FiraSans'))),
                                                      duration:
                                                          Duration(seconds: 3),
                                                    )))
                                                .then((value) => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Login())));
                                          },
                                        ),
                                      ],
                                    );
                                  }));
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.hasError.toString()),
                              );
                            } else {
                              return const Center(child: Text("No Data"));
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xff024578),
                              ),
                            );
                          }
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
