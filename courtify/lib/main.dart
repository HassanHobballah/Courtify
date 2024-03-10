// TODO Implement this library.
// ignore_for_file: unused_import

import 'package:courtify/Screen/signin_screen.dart';
import 'package:courtify/Screen/signup_screen.dart';
import 'package:courtify/Screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart'; // Import the Firebase options

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Initialize Firebase
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courtify',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 0, 0, 113),
          secondary: Color.fromARGB(255, 236, 236, 238),
          background: Color.fromARGB(255, 0, 0, 113),
          surface: Color.fromARGB(255, 0, 0, 46),
          onBackground: Color.fromARGB(255, 233, 234, 238),
          onSurface: Color.fromARGB(255, 255, 255, 255),
          error: Colors.red,
          onPrimary: Color.fromARGB(255, 229, 231, 236),
          onSecondary: Color.fromARGB(255, 1, 1, 73),
          brightness: Brightness.light,
          onError: Colors.red,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}//050236
//1801cd 
