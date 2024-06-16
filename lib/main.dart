import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tranzac/pages/splash.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(KhaltiScope(
    publicKey: 'test_public_key_7931fdc0ee93492cb2a372a19a0a92a9',
    enabledDebugging: true,
    builder: (context, navKey) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        // initialRoute: '/splash',
        // routes: {
        //   '/splash': (context) => const Splash(),
        //   '/login': (context) => const Login(),
        //   '/signup': (context) => const SignUp(),
        //   '/homepage': (context) => const HomePage(),
        //   '/abstract': (context) => const Abstract(),
        //   '/budget': (context) => const Budget_History()
        // },
        navigatorKey: navKey,
        localizationsDelegates: const [KhaltiLocalizations.delegate],
      );
    },
  ));
}
