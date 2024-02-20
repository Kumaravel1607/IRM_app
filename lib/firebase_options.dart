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
    apiKey: 'AIzaSyCgeiElxh9JbzbOReLCsnJCnW1M9qMIEZA',
    appId: '1:885206793181:web:10648db7008e5efc655434',
    messagingSenderId: '885206793181',
    projectId: 'irmdesk-54fb6',
    authDomain: 'irmdesk-54fb6.firebaseapp.com',
    storageBucket: 'irmdesk-54fb6.appspot.com',
    measurementId: 'G-K7RH7N78Y9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHXwLDpENExZhVaKEjeR3Pl1V18MVzZ1A',
    appId: '1:885206793181:android:eb4a775544c052af655434',
    messagingSenderId: '885206793181',
    projectId: 'irmdesk-54fb6',
    storageBucket: 'irmdesk-54fb6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAie67wkJ5z4XegTktam10wW_1Ko_55Gcs',
    appId: '1:885206793181:ios:ef41e70a1b70e396655434',
    messagingSenderId: '885206793181',
    projectId: 'irmdesk-54fb6',
    storageBucket: 'irmdesk-54fb6.appspot.com',
    iosBundleId: 'com.example.irmdesks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAie67wkJ5z4XegTktam10wW_1Ko_55Gcs',
    appId: '1:885206793181:ios:e598cc6c0b3a1859655434',
    messagingSenderId: '885206793181',
    projectId: 'irmdesk-54fb6',
    storageBucket: 'irmdesk-54fb6.appspot.com',
    iosBundleId: 'com.example.irmdesks.RunnerTests',
  );
}
