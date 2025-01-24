import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCUoaIOXzg7TUQNI_XhiIVhg210eYl3X8w",
            authDomain: "encontresaloes.firebaseapp.com",
            projectId: "encontresaloes",
            storageBucket: "encontresaloes.appspot.com",
            messagingSenderId: "875851683004",
            appId: "1:875851683004:web:449ecd01b70cd35e982cb9"));
  } else {
    await Firebase.initializeApp();
  }
}
