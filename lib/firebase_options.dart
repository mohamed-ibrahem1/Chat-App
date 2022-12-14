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
    apiKey: 'AIzaSyCSwbvieBcL9laFf7rvGP1nMSqXzEtwIUI',
    appId: '1:893098170536:web:62366191a175e3c6ad0a9d',
    messagingSenderId: '893098170536',
    projectId: 'chat-app-425ab',
    authDomain: 'chat-app-425ab.firebaseapp.com',
    storageBucket: 'chat-app-425ab.appspot.com',
    measurementId: 'G-LCMB4Q7FP8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIblHh00qLxyrSy84dUdj5Si0MBtgSYfs',
    appId: '1:893098170536:android:95b22cb784fd98fead0a9d',
    messagingSenderId: '893098170536',
    projectId: 'chat-app-425ab',
    storageBucket: 'chat-app-425ab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_ECW1bpUf5Ht26oipBoHpoawABe90fyo',
    appId: '1:893098170536:ios:6de36be8af72ec37ad0a9d',
    messagingSenderId: '893098170536',
    projectId: 'chat-app-425ab',
    storageBucket: 'chat-app-425ab.appspot.com',
    iosClientId: '893098170536-s4qprvpt97cvsenc152q3gh32eu7p0hc.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_ECW1bpUf5Ht26oipBoHpoawABe90fyo',
    appId: '1:893098170536:ios:6de36be8af72ec37ad0a9d',
    messagingSenderId: '893098170536',
    projectId: 'chat-app-425ab',
    storageBucket: 'chat-app-425ab.appspot.com',
    iosClientId: '893098170536-s4qprvpt97cvsenc152q3gh32eu7p0hc.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
