// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAdtqJGzUCVMrxvnxwJIk9BeLO7oIrZHZA',
    appId: '1:734060512200:web:6026967f333b401ab6b6fd',
    messagingSenderId: '734060512200',
    projectId: 'courtify-back',
    authDomain: 'courtify-back.firebaseapp.com',
    storageBucket: 'courtify-back.appspot.com',
    measurementId: 'G-5VKGM1W1M7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnuwkyx6xxYHINCXzoHtx1laJtLLm1rjs',
    appId: '1:734060512200:android:a442edeb1e5f36fab6b6fd',
    messagingSenderId: '734060512200',
    projectId: 'courtify-back',
    storageBucket: 'courtify-back.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqGMfI09KahPj4EeLFROMwfkfgmK2mDF8',
    appId: '1:734060512200:ios:f0a604c7c37b35d7b6b6fd',
    messagingSenderId: '734060512200',
    projectId: 'courtify-back',
    storageBucket: 'courtify-back.appspot.com',
    iosBundleId: 'com.example.court',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAqGMfI09KahPj4EeLFROMwfkfgmK2mDF8',
    appId: '1:734060512200:ios:457801c60634fc72b6b6fd',
    messagingSenderId: '734060512200',
    projectId: 'courtify-back',
    storageBucket: 'courtify-back.appspot.com',
    iosBundleId: 'com.example.court.RunnerTests',
  );
}