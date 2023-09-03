import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyARkrXdTcxwNv8Juhom82yFV0M-qdnDfOQ",
            authDomain: "testcase1-b33f8.firebaseapp.com",
            projectId: "testcase1-b33f8",
            storageBucket: "testcase1-b33f8.appspot.com",
            messagingSenderId: "638722195564",
            appId: "1:638722195564:web:eed1dbfde6e34104d59849"));
  } else {
    await Firebase.initializeApp();
  }
}
