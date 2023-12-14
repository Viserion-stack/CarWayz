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
    apiKey: 'AIzaSyBSQXfIjvW5V1375b-z6d0gN3PtLYgq8Xk',
    appId: '1:425463681392:web:1256c2b4c76a547ec6bfb5',
    messagingSenderId: '425463681392',
    projectId: 'flutter-car-wayz-app',
    authDomain: 'flutter-car-wayz-app.firebaseapp.com',
    storageBucket: 'flutter-car-wayz-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGOnTV_amEtWKhT2kyTVPWpnUEZKNQH4I',
    appId: '1:425463681392:android:ecc94424c186192bc6bfb5',
    messagingSenderId: '425463681392',
    projectId: 'flutter-car-wayz-app',
    storageBucket: 'flutter-car-wayz-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoHq8kWIzOYXjdK6PZ4wRj_ukd1xV7DR0',
    appId: '1:425463681392:ios:29534dd95c825c54c6bfb5',
    messagingSenderId: '425463681392',
    projectId: 'flutter-car-wayz-app',
    storageBucket: 'flutter-car-wayz-app.appspot.com',
    iosClientId: '425463681392-uth2eu4e5fidvsvre16k42laujjre06o.apps.googleusercontent.com',
    iosBundleId: 'com.example.carWayz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDoHq8kWIzOYXjdK6PZ4wRj_ukd1xV7DR0',
    appId: '1:425463681392:ios:73869bc0a813fa88c6bfb5',
    messagingSenderId: '425463681392',
    projectId: 'flutter-car-wayz-app',
    storageBucket: 'flutter-car-wayz-app.appspot.com',
    iosClientId: '425463681392-div41qabv1amg8kioijracfa7027t0qd.apps.googleusercontent.com',
    iosBundleId: 'com.example.carWayz.RunnerTests',
  );
}
