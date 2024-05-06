// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD0EFrnHhLgVlE_ArbEZrmN46JNORWF1C8',
    appId: '1:457756482148:web:698db6145180dc8e6ddd71',
    messagingSenderId: '457756482148',
    projectId: 'tranzac-934cd',
    authDomain: 'tranzac-934cd.firebaseapp.com',
    storageBucket: 'tranzac-934cd.appspot.com',
    measurementId: 'G-YDCDB66L9J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADpZa-PApLpzBhPh8ZPEpSj2feldLGCLc',
    appId: '1:457756482148:android:c24c89eeb131c7ec6ddd71',
    messagingSenderId: '457756482148',
    projectId: 'tranzac-934cd',
    storageBucket: 'tranzac-934cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhx-PkkUMAyWxkV_mEVubb58dLEIsqEdI',
    appId: '1:457756482148:ios:b46870bb7f2857356ddd71',
    messagingSenderId: '457756482148',
    projectId: 'tranzac-934cd',
    storageBucket: 'tranzac-934cd.appspot.com',
    iosBundleId: 'com.example.tranzac',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhx-PkkUMAyWxkV_mEVubb58dLEIsqEdI',
    appId: '1:457756482148:ios:b46870bb7f2857356ddd71',
    messagingSenderId: '457756482148',
    projectId: 'tranzac-934cd',
    storageBucket: 'tranzac-934cd.appspot.com',
    iosBundleId: 'com.example.tranzac',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD0EFrnHhLgVlE_ArbEZrmN46JNORWF1C8',
    appId: '1:457756482148:web:cee4c4ad985000426ddd71',
    messagingSenderId: '457756482148',
    projectId: 'tranzac-934cd',
    authDomain: 'tranzac-934cd.firebaseapp.com',
    storageBucket: 'tranzac-934cd.appspot.com',
    measurementId: 'G-LFS2SNT8LF',
  );
}
