import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC646CgU_yTrD1mZOHPZ3NaU1sWTPVmRFs",
            authDomain: "my-app-qj3lo1.firebaseapp.com",
            projectId: "my-app-qj3lo1",
            storageBucket: "my-app-qj3lo1.appspot.com",
            messagingSenderId: "246459101826",
            appId: "1:246459101826:web:7c7dae26afeda606f33a9b"));
  } else {
    await Firebase.initializeApp();
  }
}
