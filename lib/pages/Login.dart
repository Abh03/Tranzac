import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        body: Stack(children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                  color: Color(0xFF024578),
                ),
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(20),
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Center(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'LOGO',
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Welcome to ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Tranzac",
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.orange[400],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 250,
              left: 38,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                width: 320,
                height: 320,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(05),
                        color: Color(0xFFD9D9D9),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                      width: 250,
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(2, 20, 20, 20)),
                          Icon(Icons.mail),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Enter your email',
                            style: TextStyle(color: Color(0xFF818181)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(05),
                        color: Color(0xFFD9D9D9),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      width: 250,
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(2, 20, 20, 20)),
                          Icon(Icons.lock),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Enter your password',
                            style: TextStyle(color: Color(0xFF818181)),
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(05),
                          color: Color(0xFF526D82),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                        width: 250,
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        )),
                    Container(
                      child: Text(
                        'Forgot Password?',
                        style:
                            TextStyle(color: Color(0Xff526D82), fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 20, 10),
                      child: Row(children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Sign Up ',
                          style:
                              TextStyle(color: Color(0Xff526D82), fontSize: 15),
                        )
                      ]),
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
