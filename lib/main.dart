import 'package:flutter/material.dart';
import 'package:tranzac/pages/Login.dart';
import 'package:tranzac/pages/splash.dart';
import 'package:tranzac/pages/Signup.dart';
import 'package:tranzac/pages/Homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/': (context) => Splash(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/homepage': (context) => HomePage(),
    },
  ));
}
