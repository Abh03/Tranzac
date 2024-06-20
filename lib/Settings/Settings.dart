import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/pages/Login.dart';
import 'package:tranzac/constants.dart';

final user = FirebaseAuth.instance;

class Sttgs extends StatefulWidget {
  const Sttgs({super.key});

  @override
  State<Sttgs> createState() => _SettingsState();
}

class _SettingsState extends State<Sttgs> {
  final pwdemail = TextEditingController();

  @override
  void dispose() {
    pwdemail.dispose();
    super.dispose();
  }

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
                        builder: (context) => AlertDialog(
                          title: const Text("About Tranzac"),
                          content: const SingleChildScrollView(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '"Tranzac" is a cutting-edge mobile app developed by Kathmandu University\'s Department of Computer Science and Engineering students to streamline personal finance management. It integrates Nepali payment gateways like Esewa and Khalti for secure in-app transactions. ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Beyond payments, "Tranzac" offers real-time budget tracking across spending categories, tools for managing borrowing and lending, and promotes financial transparency. Designed with Flutter for a seamless user experience, it uses Firebase for secure storage of user profiles and transaction histories. ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.password),
                    title: const Text("Change password"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title:
                                  const Center(child: Text("Reset Password")),
                              actionsPadding: const EdgeInsets.all(10),
                              actions: [
                                TextFormField(
                                    controller: pwdemail,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[\w-\.]+@+[\w-\.]+.com')
                                              .hasMatch(value)) {
                                        return "Please enter correct email";
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      hoverColor: kNewAppBarColor,
                                      hintText:
                                          "Enter email address to send link",
                                      labelText: "Email address",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => kNewAppBarColor),
                                          foregroundColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.white)),
                                      onPressed: () {
                                        user
                                            .sendPasswordResetEmail(
                                                email: pwdemail.text.trim())
                                            .whenComplete(() {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Center(
                                                child: Text(
                                                    "Email sent successfully",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'FiraSans'))),
                                            duration: Duration(seconds: 3),
                                          ));
                                        }).then((value) =>
                                                Navigator.pop(context));
                                      },
                                      child: const Text("Send link")),
                                )
                              ],
                            );
                          });
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Log Out"),
                    onTap: () async {
                      await user.signOut().whenComplete(() {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Center(
                            child: Text(
                              "Logged out successfully",
                              style: TextStyle(fontFamily: 'FiraSans'),
                            ),
                          ),
                          duration: Duration(seconds: 3),
                        ));
                      }).then((value) => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                            (Route<dynamic> route) => false,
                          ));
                    },
                  )
                ],
              );
            }));
  }
}
