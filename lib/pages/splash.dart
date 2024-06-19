import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tranzac/pages/Login.dart';
import 'package:tranzac/constants.dart';

class Splash extends StatefulWidget {
  @override
  State <Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>{
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(
          builder: (context) => const Login(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    EdgeInsets marginWelcome = EdgeInsets.only(top: height * 0.15);
    EdgeInsets marginButtons = EdgeInsets.only(top: height * 0.7);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kNewAppBarColor,
              kGradientChange,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background gradient
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kNewAppBarColor,
                      kGradientChange,
                    ],
                  ),
                ),
              ),
            ),
            // Image at the center
            Positioned(
              top: height * 0.3, // Adjust position as per your requirement
              child: Image.asset(
                'assests/images/logo1.png', // Replace with your image path
                height: height * 0.45, // Adjust height as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
