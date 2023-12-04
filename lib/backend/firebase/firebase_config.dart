import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDCTqsBpj5Hf4NGjKFHtmg_xArMIRiQEL4",
            authDomain: "sawad-new-ibs.firebaseapp.com",
            projectId: "sawad-new-ibs",
            storageBucket: "sawad-new-ibs.appspot.com",
            messagingSenderId: "556125230802",
            appId: "1:556125230802:web:d981210df4ec6465753f0b",
            measurementId: "G-YN5XS10G5T"));
  } else {
    await Firebase.initializeApp();
  }
}
