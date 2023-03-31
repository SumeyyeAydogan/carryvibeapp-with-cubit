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
    apiKey: 'AIzaSyDVo9jHkJnCSlapvkFMKHQtY7Tok8aF0tQ',
    appId: '1:879195820130:web:0fcbc07a92678fc037813b',
    messagingSenderId: '879195820130',
    projectId: 'carryvibe-c93f7',
    authDomain: 'carryvibe-c93f7.firebaseapp.com',
    storageBucket: 'carryvibe-c93f7.appspot.com',
    measurementId: 'G-JYYJ3VEX3M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAN6mXU4Jj0XJdmq5UeLz3GHS61m7ifQnA',
    appId: '1:879195820130:android:2ea6c10d5dd2e46037813b',
    messagingSenderId: '879195820130',
    projectId: 'carryvibe-c93f7',
    storageBucket: 'carryvibe-c93f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAv8MNY-OUynUk3tSRlDQolyebbTk0wKlU',
    appId: '1:879195820130:ios:97504e747413e0c637813b',
    messagingSenderId: '879195820130',
    projectId: 'carryvibe-c93f7',
    storageBucket: 'carryvibe-c93f7.appspot.com',
    iosClientId: '879195820130-4i0el9nucps4d5htn4mf0e4e7qm8ro6t.apps.googleusercontent.com',
    iosBundleId: 'app.carryvibe.com.carryvibeapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAv8MNY-OUynUk3tSRlDQolyebbTk0wKlU',
    appId: '1:879195820130:ios:97504e747413e0c637813b',
    messagingSenderId: '879195820130',
    projectId: 'carryvibe-c93f7',
    storageBucket: 'carryvibe-c93f7.appspot.com',
    iosClientId: '879195820130-4i0el9nucps4d5htn4mf0e4e7qm8ro6t.apps.googleusercontent.com',
    iosBundleId: 'app.carryvibe.com.carryvibeapp',
  );
}