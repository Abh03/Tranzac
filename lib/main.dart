import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tranzac/pages/Abstract.dart';
import 'firebase_options.dart';
import 'package:tranzac/pages/Login.dart';
import 'package:tranzac/pages/splash.dart';
import 'package:tranzac/pages/Signup.dart';
import 'package:tranzac/pages/Homepage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/abstract',
    routes: {
      '/': (context) => const Splash(),
      '/login': (context) => const Login(),
      '/signup': (context) => const SignUp(),
      '/homepage': (context) => const HomePage(),
      '/abstract': (context) => const   Abstract()
    },
  ));
}
