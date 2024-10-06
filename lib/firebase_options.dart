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
    apiKey: 'AIzaSyCdUMjmq7ns5wzw542ch06OKulaRN0obrQ',
    appId: '1:808623155797:web:2c2e8fbe4cd93b211742dc',
    messagingSenderId: '808623155797',
    projectId: 'loginfirebase-33214',
    authDomain: 'loginfirebase-33214.firebaseapp.com',
    storageBucket: 'loginfirebase-33214.appspot.com',
    measurementId: 'G-GCMHHB0XSZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhwc-B2Lc1zpffjn0Gd_9b_xPD3ioDco0',
    appId: '1:808623155797:android:f74cde012f952a451742dc',
    messagingSenderId: '808623155797',
    projectId: 'loginfirebase-33214',
    storageBucket: 'loginfirebase-33214.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbLRLNTF-zcTPHjW_zUL6AItFnBFBknO8',
    appId: '1:808623155797:ios:2a90e639fb0ce71e1742dc',
    messagingSenderId: '808623155797',
    projectId: 'loginfirebase-33214',
    storageBucket: 'loginfirebase-33214.appspot.com',
    iosBundleId: 'com.example.loginFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbLRLNTF-zcTPHjW_zUL6AItFnBFBknO8',
    appId: '1:808623155797:ios:2a90e639fb0ce71e1742dc',
    messagingSenderId: '808623155797',
    projectId: 'loginfirebase-33214',
    storageBucket: 'loginfirebase-33214.appspot.com',
    iosBundleId: 'com.example.loginFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCdUMjmq7ns5wzw542ch06OKulaRN0obrQ',
    appId: '1:808623155797:web:9303f799976c45af1742dc',
    messagingSenderId: '808623155797',
    projectId: 'loginfirebase-33214',
    authDomain: 'loginfirebase-33214.firebaseapp.com',
    storageBucket: 'loginfirebase-33214.appspot.com',
    measurementId: 'G-ZJ9LHJ97QH',
  );
}
