import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:30),

          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assests/images/profile.png'),
          ),
      ),

          SizedBox(height: 8),
          Text(
            'Aavash Lamichhane',
            style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 1),
          Text(
            '9876236474',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),

          SizedBox(height: 1),
          Text(
            'aavash@gmail.com',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(height:30),
          Divider(),
          SizedBox(height: 10),

          ListTile(
            title: Text('DOB'),
            subtitle: Text('25/01/2004'),
            leading: Icon(CupertinoIcons.calendar),
            tileColor: Colors.blueAccent,
          ),

          ListTile(
            title: Text('Occupation'),
            subtitle: Text('Student'),
            leading: Icon(CupertinoIcons.bag),
            tileColor: Colors.blueAccent,
          ),

          ListTile(
          title: Text('Gender'),
          subtitle: Text('Male'),
          leading: Icon(CupertinoIcons.calendar),
          tileColor: Colors.blueAccent,
          ),

          ListTile(
          title: Text('Address'),
          subtitle: Text('Kirtipur'),
          leading: Icon(CupertinoIcons.map_pin_ellipse),
          tileColor: Colors.blueAccent,
          ),

          ListTile(
          title: Text('Bank Accounts'),
          subtitle: Text('Manage your linked bank accounts'),
          leading: Icon(CupertinoIcons.money_dollar),
          tileColor: Colors.blueAccent,
          ),

          ListTile(
          title: Text('Log Out'),
          subtitle: Text('Sign out from this device'),
          leading: Icon(CupertinoIcons.calendar),
          tileColor: Colors.blueAccent,
          ),
        ],
      ),
      ),
    );
  }
}


