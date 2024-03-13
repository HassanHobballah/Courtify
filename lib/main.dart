
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/screens.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courtify',
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
    routes: {
      '/' : (context) => LoginScreen(),
      
       'Login':(context) => LoginScreen(),
      'ForgotPassword' : (context) => ForgotPassword(),
       'CreateNewAccount':(context) => SignUp(),

    },
    );
  }
}

