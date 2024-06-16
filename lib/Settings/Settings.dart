import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/pages/Login.dart';
import 'package:tranzac/constants.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          backgroundColor: kNewAppBarColor,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text("Help"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                actions: [
                                  Text(
                                      "This is help.Please help me I am under the water,please.Here too much raining uhuhuhuhuhu")
                                ],
                              ));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.accessibility_outlined),
                    title: const Text("About us"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                actions: [Text("This is about us. lol")],
                              ));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Log Out"),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().whenComplete(() {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Center(
                            child: Text(
                              "Logged out successfully",
                              style: TextStyle(fontFamily: 'FiraSans'),
                            ),
                          ),
                          duration: Duration(seconds: 3),
                        ));
                      });

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                            (Route<dynamic> route) => false,
                      );
                    },
                  )

                ],
              );
            }));
  }
}
