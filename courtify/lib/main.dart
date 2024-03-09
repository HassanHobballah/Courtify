import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// Import page widgets
import 'pages/sign_in_page.dart'; 
import 'pages/sign_up_page.dart';  
import 'pages/HomePage.dart';  
import 'pages/CourtBookingPage.dart';
import 'pages/UserProfilePage.dart';
// import 'notifications_page.dart';
// import 'PlayingPage.dart' // join a scheduled game 
// import 'teams_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(CourtifyApp());
}

class CourtifyApp extends StatefulWidget {
  @override
  _CourtifyAppState createState() => _CourtifyAppState();
}

class _CourtifyAppState extends State<CourtifyApp> {
  final Future<FirebaseApp>_fbApp = Firebase.initializeApp();
  // Firebase Auth later
  // bool isLoggedIn = false; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courtify',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.green,
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print ('You have an error! ${snapshot.error.toString()}');
            return Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return MyHomePage(title: 'Courtify App!');
          } else {
            return Center(
              child: CircularProgressIndicator(),
              );
          }
        },
        )

      
      initialRoute: '/signIn',           //isLoggedIn ? '/main' : '/signIn'  (later)
      routes: {
      //  '/signIn': (context) => LoginPage(), // Sign-in page
      //  '/signUp': (context) => SignUpPage(), // Sign-up page
      //  '/HomePage': (context) => HomePage(), // Main page for logged-in users

        // '/CourtBooking': (context) => CourtBookingPage(), 
        // '/profile': (context) => ProfilePage(),

        // '/teams': (context) => TeamsPage(),
        // '/notifications': (context) => NotificationsPage(),
      },
    );
  }
}
