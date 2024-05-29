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
    apiKey: 'AIzaSyC6bpnU1Mv-3KO9E566qzhBfSLOFR71fiA',
    appId: '1:506861161157:web:c0a4d35811713353817eac',
    messagingSenderId: '506861161157',
    projectId: 'mobileauth-388a8',
    authDomain: 'mobileauth-388a8.firebaseapp.com',
    storageBucket: 'mobileauth-388a8.appspot.com',
    measurementId: 'G-8C84RWDXBV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVj6exN6Yrhh9FkAa4jhikQIPQjbKAiU8',
    appId: '1:506861161157:android:20d58620e1c536b3817eac',
    messagingSenderId: '506861161157',
    projectId: 'mobileauth-388a8',
    storageBucket: 'mobileauth-388a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1Ia_CTi8QlhsqJYowvI0p9M9C6MhoxHg',
    appId: '1:506861161157:ios:f28c93d521d81fdf817eac',
    messagingSenderId: '506861161157',
    projectId: 'mobileauth-388a8',
    storageBucket: 'mobileauth-388a8.appspot.com',
    iosBundleId: 'com.example.mobileAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1Ia_CTi8QlhsqJYowvI0p9M9C6MhoxHg',
    appId: '1:506861161157:ios:f28c93d521d81fdf817eac',
    messagingSenderId: '506861161157',
    projectId: 'mobileauth-388a8',
    storageBucket: 'mobileauth-388a8.appspot.com',
    iosBundleId: 'com.example.mobileAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC6bpnU1Mv-3KO9E566qzhBfSLOFR71fiA',
    appId: '1:506861161157:web:4193e0f1c2359b0d817eac',
    messagingSenderId: '506861161157',
    projectId: 'mobileauth-388a8',
    authDomain: 'mobileauth-388a8.firebaseapp.com',
    storageBucket: 'mobileauth-388a8.appspot.com',
    measurementId: 'G-ZDJH2DXN0S',
  );
}
