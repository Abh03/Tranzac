import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tranzac/pages/Homepage.dart';
import 'package:tranzac/pages/splash.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize flutter_local_notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  // final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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
