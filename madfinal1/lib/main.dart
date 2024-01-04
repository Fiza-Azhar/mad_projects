import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'signin_page.dart'; // Import the SignInPage

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAW1JL7y_Djs97ts8ix-kGhv4VjbnFdu-0",
      authDomain: "mad-final2-da0e5.firebaseapp.com",
      projectId: "mad-final2-da0e5",
      storageBucket: "mad-final2-da0e5.appspot.com",
      messagingSenderId: "531897963317",
      appId: "1:531897963317:web:065845d725f59335df327c",
      measurementId: "G-BL09P8QEN7"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SignInPage(), // Set SignInPage as the initial page
    );
  }
}
