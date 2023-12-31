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
    apiKey: 'AIzaSyCMPDE91QEs3jT0RnhEI7o_Du7XRUyJ0Hs',
    appId: '1:65589408023:web:e0929d066f91b758e0c752',
    messagingSenderId: '65589408023',
    projectId: 'shammar-shop-app',
    authDomain: 'shammar-shop-app.firebaseapp.com',
    storageBucket: 'shammar-shop-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByDAOtlyvyzJYA861bCtmMH51myspDgEk',
    appId: '1:65589408023:android:ce8352e1320fc884e0c752',
    messagingSenderId: '65589408023',
    projectId: 'shammar-shop-app',
    storageBucket: 'shammar-shop-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFGOh_Fk9xnphz-sS4v-E8x0lEZvCGsvA',
    appId: '1:65589408023:ios:e2cf98239762affce0c752',
    messagingSenderId: '65589408023',
    projectId: 'shammar-shop-app',
    storageBucket: 'shammar-shop-app.appspot.com',
    iosClientId: '65589408023-0g7hpgl2j0rrhfr6fa98cu0f35r10gqp.apps.googleusercontent.com',
    iosBundleId: 'com.example.shammarapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFGOh_Fk9xnphz-sS4v-E8x0lEZvCGsvA',
    appId: '1:65589408023:ios:e2cf98239762affce0c752',
    messagingSenderId: '65589408023',
    projectId: 'shammar-shop-app',
    storageBucket: 'shammar-shop-app.appspot.com',
    iosClientId: '65589408023-0g7hpgl2j0rrhfr6fa98cu0f35r10gqp.apps.googleusercontent.com',
    iosBundleId: 'com.example.shammarapp',
  );
}
