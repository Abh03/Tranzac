import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tranzac/pages/abstract.dart';
import 'package:tranzac/pages/login.dart';
import 'package:tranzac/pages/splash.dart';
import 'package:tranzac/pages/Signup.dart';
import 'package:tranzac/pages/Homepage.dart';
import 'package:tranzac/BudgetTracking/Budget_History.dart';

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
      '/abstract': (context) => const Abstract(),
      '/budget': (context) => const Budget_History()
    },
  ));
}
