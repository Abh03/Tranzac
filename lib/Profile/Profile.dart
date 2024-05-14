import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd7dee8),
      body: SingleChildScrollView(
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
              SizedBox(height: 8),
              const Text(
                'Aavash Lamichhane',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 1),
              const Text(
                '9876236474',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(height: 1),
              const Text(
                'aavash@gmail.com',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff3c6e98),
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
                    color: const Color(0xff3c6e98),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    children: [
                      ListTile(
                        title: Text('DOB',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text('25/01/2004',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        leading: Icon(CupertinoIcons.calendar,
                            color: Colors.white, size: 28),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Occupation',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text('Student',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        leading: Icon(CupertinoIcons.bag,
                            color: Colors.white, size: 28),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Gender',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text('Male',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        leading: Icon(LineAwesome.mars_solid,
                            color: Colors.white, size: 28),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Address',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text('Kirtipur',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        leading: Icon(CupertinoIcons.map_pin_ellipse,
                            color: Colors.white, size: 28),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Bank Accounts',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text('Manage your linked bank accounts',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        leading: Icon(CupertinoIcons.money_dollar,
                            color: Colors.white, size: 28),
                        trailing: Icon(CupertinoIcons.arrow_right,
                            color: Colors.white, size: 28),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Log Out',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text('Sign out from this device',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        leading: Icon(LineAwesome.sign_out_alt_solid,
                            color: Colors.white, size: 28),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
