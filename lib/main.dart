import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tranzac/pages/Homepage.dart';
import 'package:tranzac/pages/splash.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    KhaltiScope(
      publicKey: 'test_public_key_7931fdc0ee93492cb2a372a19a0a92a9',
      enabledDebugging: true,
      builder: (context, navKey) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splash(),
          navigatorKey: navKey,
          localizationsDelegates: const [KhaltiLocalizations.delegate],
        );
      },
    ),
  );
}
