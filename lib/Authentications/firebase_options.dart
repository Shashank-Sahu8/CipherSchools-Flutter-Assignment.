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
    apiKey: 'AIzaSyDwx77HPdCrwvpyBCsHd4luO8hFwFCX68s',
    appId: '1:627646694541:web:4aa5b0afaec886dc0d4ec4',
    messagingSenderId: '627646694541',
    projectId: 'cipherschoolsflutterassignment',
    authDomain: 'cipherschoolsflutterassignment.firebaseapp.com',
    storageBucket: 'cipherschoolsflutterassignment.appspot.com',
    measurementId: 'G-9JPP9P1RR8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsYTLZngBgNciGFKrGXftvUuKGJhj4ehc',
    appId: '1:627646694541:android:5fcc0686a4de0a460d4ec4',
    messagingSenderId: '627646694541',
    projectId: 'cipherschoolsflutterassignment',
    storageBucket: 'cipherschoolsflutterassignment.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDf6pfZaxKdy50soCRxiSLvtKj-PeaOvoA',
    appId: '1:627646694541:ios:86d43f8fcd2855150d4ec4',
    messagingSenderId: '627646694541',
    projectId: 'cipherschoolsflutterassignment',
    storageBucket: 'cipherschoolsflutterassignment.appspot.com',
    iosBundleId: 'com.example.cipherx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDf6pfZaxKdy50soCRxiSLvtKj-PeaOvoA',
    appId: '1:627646694541:ios:fcdbcdff73611ac10d4ec4',
    messagingSenderId: '627646694541',
    projectId: 'cipherschoolsflutterassignment',
    storageBucket: 'cipherschoolsflutterassignment.appspot.com',
    iosBundleId: 'com.example.cipherx.RunnerTests',
  );
}