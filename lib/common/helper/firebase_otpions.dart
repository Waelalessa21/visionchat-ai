import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform => web;

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCcLvXqwmJskDTMYUXPNSc1nUwGcrl06_M',
    appId: '1:31580510237:web:3a85dd9e8a09489ddb8ef4',
    messagingSenderId: '31580510237',
    projectId: 'vision-ai-9ab1e',
    authDomain: 'vision-ai-9ab1e.firebaseapp.com',
    storageBucket: 'vision-ai-9ab1e.appspot.com',
    measurementId: 'G-MD26SFPR6R',
  );
}
