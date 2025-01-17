import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "API_KEY",
            authDomain: "the-disciple-75324.firebaseapp.com",
            projectId: "the-disciple-75324",
            storageBucket: "the-disciple-75324.appspot.com",
            messagingSenderId: "976940171527",
            appId: "1:976940171527:web:6c95d70d294721447705a2",
            measurementId: "G-CE14NZG49N"));
  } else {
    await Firebase.initializeApp();
  }
}
