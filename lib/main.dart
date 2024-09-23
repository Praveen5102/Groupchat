import 'package:flutter/material.dart';
import 'pages/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the given options
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD7CS4o49V7wcXk-7gLVOK-byYRXkhBoYQ",
      appId: "1:39072690467:android:024f275278690701b19c96",
      messagingSenderId: "39072690467",
      projectId: "groupchat-5b421",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',

      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Cherry Swash', // Set global font
      ),

      // Set the initial route to the HomePage
      initialRoute: '/home',


      routes: {
        '/home': (context) => HomePage(), // HomePage
        '/signup': (context) => SignUpScreen(), // Signup screen
      },
    );
  }
}
