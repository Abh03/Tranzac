import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tranzac/pages/splash.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize flutter_local_notifications
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  // final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(
    KhaltiScope(
      publicKey: 'test_public_key_7931fdc0ee93492cb2a372a19a0a92a9',
      enabledDebugging: true,
      builder: (context, navKey) {
        return ScreenUtilInit(
          designSize: const Size(375, 812), // Set the design size as per your design
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const Splash(),
              navigatorKey: navKey,
              localizationsDelegates: const [KhaltiLocalizations.delegate],
            );
          },
        );
      },
    ),
  );
}
