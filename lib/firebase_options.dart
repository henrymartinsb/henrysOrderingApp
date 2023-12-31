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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAqttjkwXn6m_LoCisHG-8qFp1ZZwBD4rE',
    appId: '1:470748639722:web:9690bc694fcd9f2f8a4293',
    messagingSenderId: '470748639722',
    projectId: 'henrysordering',
    authDomain: 'henrysordering.firebaseapp.com',
    storageBucket: 'henrysordering.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBa01M-rY5FWHpU1e4KACKliPCoUXsO4gs',
    appId: '1:470748639722:android:a1f1e505cc8a37c98a4293',
    messagingSenderId: '470748639722',
    projectId: 'henrysordering',
    storageBucket: 'henrysordering.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfjLJmldP7q3dC5hdIAY2es3b6eR_o5O8',
    appId: '1:470748639722:ios:94e4e04964f710cc8a4293',
    messagingSenderId: '470748639722',
    projectId: 'henrysordering',
    storageBucket: 'henrysordering.appspot.com',
    iosClientId: '470748639722-08va5orlrp91n0hevmml61a8fuc3kock.apps.googleusercontent.com',
    iosBundleId: 'com.spacedsoft.henrysGroceryStore',
  );
}
