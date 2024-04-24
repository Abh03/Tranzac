import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFD7DEE8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                      color: Color(0xFF02457A)),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          "Create Account",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 180,
                left: 40,
                height: 550,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: 310,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Sign Up',
                          style:
                              TextStyle(fontSize: 25, color: Color(0xFF526D82)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(05)),
                            color: Color(0xFFD9D9D9)),
                        child: Text(
                          'Enter your first name',
                          style:
                              TextStyle(color: Color(0xFF818181), fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(05)),
                            color: Color(0xFFD9D9D9)),
                        child: Text(
                          'Enter your middle name',
                          style:
                              TextStyle(color: Color(0xFF818181), fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(05)),
                            color: Color(0xFFD9D9D9)),
                        child: Text(
                          'Enter your last name',
                          style:
                              TextStyle(color: Color(0xFF818181), fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(05)),
                            color: Color(0xFFD9D9D9)),
                        child: Text(
                          'Enter your mobile number',
                          style:
                              TextStyle(color: Color(0xFF818181), fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(05)),
                            color: Color(0xFFD9D9D9)),
                        child: Text(
                          'Enter your email address',
                          style:
                              TextStyle(color: Color(0xFF818181), fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(05)),
                            color: Color(0xFFD9D9D9)),
                        child: Text(
                          'Re-enter your password',
                          style:
                              TextStyle(color: Color(0xFF818181), fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(05)),
                            color: Color(0xFF526D82)),
                        child: Text(
                          'Sign Up ',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Log In',
                            style: TextStyle(
                                color: Color(0xFF526D82), fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
