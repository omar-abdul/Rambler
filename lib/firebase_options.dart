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
    apiKey: 'AIzaSyCeZdas-mZq2_jpNU8roOOtDDNkcMJeCag',
    appId: '1:646678124422:web:3c98a713600bce93ad3e07',
    messagingSenderId: '646678124422',
    projectId: 'bramble-a62de',
    authDomain: 'bramble-a62de.firebaseapp.com',
    storageBucket: 'bramble-a62de.appspot.com',
    measurementId: 'G-3L6SJ8D8SG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZfbta4pZ0MwAigLVuC4EYbGKoeg5vCX4',
    appId: '1:646678124422:android:8de297cb3c53f5f9ad3e07',
    messagingSenderId: '646678124422',
    projectId: 'bramble-a62de',
    storageBucket: 'bramble-a62de.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFxrtStUY-QzOIGvAS4rDwl4J1mQkpX_g',
    appId: '1:646678124422:ios:d5ae6a1bdef586abad3e07',
    messagingSenderId: '646678124422',
    projectId: 'bramble-a62de',
    storageBucket: 'bramble-a62de.appspot.com',
    iosClientId: '646678124422-rjbhk99d18a3ab96e43n3do5faff4qiv.apps.googleusercontent.com',
    iosBundleId: 'com.example.brambleProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFxrtStUY-QzOIGvAS4rDwl4J1mQkpX_g',
    appId: '1:646678124422:ios:d5ae6a1bdef586abad3e07',
    messagingSenderId: '646678124422',
    projectId: 'bramble-a62de',
    storageBucket: 'bramble-a62de.appspot.com',
    iosClientId: '646678124422-rjbhk99d18a3ab96e43n3do5faff4qiv.apps.googleusercontent.com',
    iosBundleId: 'com.example.brambleProject',
  );
}
