import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/pages/Login.dart';
import 'package:tranzac/constants.dart';

final user = FirebaseAuth.instance;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                          builder: (context) => const AlertDialog(
                                actions: [Text("This is about us. lol")],
                              ));
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
                                        user.sendPasswordResetEmail(
                                            email: pwdemail.text.trim()).whenComplete(() {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      content: Center(
                                                          child: Text(
                                                              "Email sent successfully",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'FiraSans'))),
                                                      duration:
                                                          Duration(seconds: 3),
                                                    ));
                                                  }).then((value) => Navigator.pop(context));
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
