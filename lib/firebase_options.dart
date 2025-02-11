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
    apiKey: 'AIzaSyACTRUtkSIaMH5KABAhNrVLknlmAFkyxI0',
    appId: '1:668758974932:web:98150b987ec0d603b43641',
    messagingSenderId: '668758974932',
    projectId: 'english-story-9b2dd',
    authDomain: 'english-story-9b2dd.firebaseapp.com',
    storageBucket: 'english-story-9b2dd.firebasestorage.app',
    measurementId: 'G-SC8H5CL900',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFh3dWQyYwHytlsSmi2nRlRhtIQReGtBI',
    appId: '1:668758974932:android:1e415e31e5d0139eb43641',
    messagingSenderId: '668758974932',
    projectId: 'english-story-9b2dd',
    storageBucket: 'english-story-9b2dd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACA-RbQn0StocPY04_igEla9RTfiKOafA',
    appId: '1:668758974932:ios:5ebdfc03d7b6ad5ab43641',
    messagingSenderId: '668758974932',
    projectId: 'english-story-9b2dd',
    storageBucket: 'english-story-9b2dd.firebasestorage.app',
    iosBundleId: 'com.emirbaris.englishWillFly',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACA-RbQn0StocPY04_igEla9RTfiKOafA',
    appId: '1:668758974932:ios:5ebdfc03d7b6ad5ab43641',
    messagingSenderId: '668758974932',
    projectId: 'english-story-9b2dd',
    storageBucket: 'english-story-9b2dd.firebasestorage.app',
    iosBundleId: 'com.emirbaris.englishWillFly',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCFH6Ps7lQb-1pczHbvBn_JPMqVCKkXfko',
    appId: '1:668758974932:web:4fe28a9d577d9bfcb43641',
    messagingSenderId: '668758974932',
    projectId: 'english-story-9b2dd',
    authDomain: 'english-story-9b2dd.firebaseapp.com',
    storageBucket: 'english-story-9b2dd.firebasestorage.app',
    measurementId: 'G-Q7TG6D4P6C',
  );

}