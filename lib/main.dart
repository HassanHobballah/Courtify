import 'package:court/Screens/forgotPassword.dart';
import 'package:court/Screens/login_screen.dart';
import 'package:court/Screens/signup_screen.dart';
import 'package:court/Services/user_service.dart';
import 'package:court/firebase_options.dart';
import 'package:court/main_layout.dart';
import 'package:court/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Courtify',
      theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<User?>(
        stream: _userService.userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              // User is signed in, fetch user data
              return FutureBuilder<Map<String, dynamic>?>(
                future: _userService.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      // Pass the user data to the UserProfilePage
                      return UserProfilePage(userData: snapshot.data!);
                    } else {
                      return const Text('No user data available');
                    }
                  }
                  return const CircularProgressIndicator();
                },
              );
            } else {
              // User is not signed in, show the LoginScreen
              return LoginScreen();
            }
          }
          return const CircularProgressIndicator();
        },
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/forgotPassword': (context) => ForgotPassword(),
        '/createNewAccount': (context) => SignUpScreen(),
        '/mainLayout': (context) => const MainLayout(),
        // Remove '/profile' route if you're using FutureBuilder to fetch user data
      },
    );
  }
}
