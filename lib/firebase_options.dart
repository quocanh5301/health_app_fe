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
    apiKey: 'AIzaSyA6F0p36fDgGqYJX8wC_KPTcuzdusH-SXY',
    appId: '1:93445307496:web:f66b6085ad827467d38fdd',
    messagingSenderId: '93445307496',
    projectId: 'fitness-db178',
    authDomain: 'fitness-db178.firebaseapp.com',
    storageBucket: 'fitness-db178.appspot.com',
    measurementId: 'G-TFQKDS9PYH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeil094XjHIfTv9BLeMqjU4qF7Zmrs4mw',
    appId: '1:93445307496:android:b024c7f45f05f0a2d38fdd',
    messagingSenderId: '93445307496',
    projectId: 'fitness-db178',
    storageBucket: 'fitness-db178.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADmr1tvwvqG7QVJm6GiDbu5ssQ1LmGwJ4',
    appId: '1:93445307496:ios:f600c1cd8cba709ed38fdd',
    messagingSenderId: '93445307496',
    projectId: 'fitness-db178',
    storageBucket: 'fitness-db178.appspot.com',
    iosBundleId: 'com.example.healthAppFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADmr1tvwvqG7QVJm6GiDbu5ssQ1LmGwJ4',
    appId: '1:93445307496:ios:f600c1cd8cba709ed38fdd',
    messagingSenderId: '93445307496',
    projectId: 'fitness-db178',
    storageBucket: 'fitness-db178.appspot.com',
    iosBundleId: 'com.example.healthAppFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA6F0p36fDgGqYJX8wC_KPTcuzdusH-SXY',
    appId: '1:93445307496:web:9987b395bbe72667d38fdd',
    messagingSenderId: '93445307496',
    projectId: 'fitness-db178',
    authDomain: 'fitness-db178.firebaseapp.com',
    storageBucket: 'fitness-db178.appspot.com',
    measurementId: 'G-C674E12SEJ',
  );
}
