import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tranzac/pages/splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
    // initialRoute: '/splash',
    // routes: {
    //   '/splash': (context) => const Splash(),
    //   '/login': (context) => const Login(),
    //   '/signup': (context) => const SignUp(),
    //   '/homepage': (context) => const HomePage(),
    //   '/abstract': (context) => const Abstract(),
    //   '/budget': (context) => const Budget_History()
    // },
  ));
}
