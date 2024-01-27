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
    apiKey: 'AIzaSyD7BJiwIa7J2llFnmYe-eHTtKJi11gnBxc',
    appId: '1:162564554099:web:7d8d43779925e659d1d906',
    messagingSenderId: '162564554099',
    projectId: 'heimdall-5aecb',
    authDomain: 'heimdall-5aecb.firebaseapp.com',
    databaseURL: 'https://heimdall-5aecb-default-rtdb.firebaseio.com',
    storageBucket: 'heimdall-5aecb.appspot.com',
    measurementId: 'G-YJY39SDG6Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVWXtVDuqS4RHmzm8ujqrZOhgLTX-nYEs',
    appId: '1:162564554099:android:2aa8178e9c75991cd1d906',
    messagingSenderId: '162564554099',
    projectId: 'heimdall-5aecb',
    databaseURL: 'https://heimdall-5aecb-default-rtdb.firebaseio.com',
    storageBucket: 'heimdall-5aecb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2Co2tw72sqkkvuNuHMaaYsUibxPOFN60',
    appId: '1:162564554099:ios:a45370919681b809d1d906',
    messagingSenderId: '162564554099',
    projectId: 'heimdall-5aecb',
    databaseURL: 'https://heimdall-5aecb-default-rtdb.firebaseio.com',
    storageBucket: 'heimdall-5aecb.appspot.com',
    androidClientId: '162564554099-iuf0rsrg8dsc2b18a78lhv5vr08qu59e.apps.googleusercontent.com',
    iosClientId: '162564554099-mrl41lus9ge690420dbrogr7vprsgblg.apps.googleusercontent.com',
    iosBundleId: 'com.example.heimdalladmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2Co2tw72sqkkvuNuHMaaYsUibxPOFN60',
    appId: '1:162564554099:ios:2b3985ccb0531cecd1d906',
    messagingSenderId: '162564554099',
    projectId: 'heimdall-5aecb',
    databaseURL: 'https://heimdall-5aecb-default-rtdb.firebaseio.com',
    storageBucket: 'heimdall-5aecb.appspot.com',
    androidClientId: '162564554099-iuf0rsrg8dsc2b18a78lhv5vr08qu59e.apps.googleusercontent.com',
    iosClientId: '162564554099-v74ra11q509v704u7dukumni54rinmlp.apps.googleusercontent.com',
    iosBundleId: 'com.example.heimdalladmin.RunnerTests',
  );
}
