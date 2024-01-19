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
    apiKey: 'AIzaSyAYiuIbjadQr6rV3DCWGX-TjutUqKJ_wrc',
    appId: '1:232540212431:web:d57a8ef867073a3a41bbba',
    messagingSenderId: '232540212431',
    projectId: 'projectname-a1bc5',
    authDomain: 'projectname-a1bc5.firebaseapp.com',
    storageBucket: 'projectname-a1bc5.appspot.com',
    measurementId: 'G-4R7V0HJGEF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1PFIUICZOSpIB1bXLAPMsky4fUFUxQ-M',
    appId: '1:232540212431:android:5754eb2e925870cb41bbba',
    messagingSenderId: '232540212431',
    projectId: 'projectname-a1bc5',
    storageBucket: 'projectname-a1bc5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuSEZadq5lhEXA3cIaOsQ-cy35FeonoxU',
    appId: '1:232540212431:ios:c37ee95f56c2dec741bbba',
    messagingSenderId: '232540212431',
    projectId: 'projectname-a1bc5',
    storageBucket: 'projectname-a1bc5.appspot.com',
    iosBundleId: 'com.example.firebaselogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCuSEZadq5lhEXA3cIaOsQ-cy35FeonoxU',
    appId: '1:232540212431:ios:dfb997dee8d6c41a41bbba',
    messagingSenderId: '232540212431',
    projectId: 'projectname-a1bc5',
    storageBucket: 'projectname-a1bc5.appspot.com',
    iosBundleId: 'com.example.firebaselogin.RunnerTests',
  );
}