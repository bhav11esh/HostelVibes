import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDm672_ONsLEGxyBLA5Y0DMdmT00CIn2FM",
            authDomain: "travelv2f.firebaseapp.com",
            projectId: "travelv2f",
            storageBucket: "travelv2f.appspot.com",
            messagingSenderId: "803679507681",
            appId: "1:803679507681:web:4362b754fd4aa189f853a0",
            measurementId: "G-2WYY2MF93G"));
  } else {
    await Firebase.initializeApp();
  }
}
