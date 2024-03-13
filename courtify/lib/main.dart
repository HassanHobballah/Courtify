
// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

// import 'package:homescreennew/main_layout.dart';
// import 'package:homescreennew/config.dart';
// import 'package:flutter/material.dart';
// import 'package:homescreennew/userprofile.dart';
// // import 'profile_page.dart';


// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

//  
// }
import 'package:flutter/material.dart';
import 'config.dart';
import 'userprofile.dart';
import 'main_layout.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Courtify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayout(),
        '/profile': (context) => UserProfilePage(
              title: 'Courtify',
              initialFirstName: 'First',
              initialLastName: 'Last',
              initialBio: 'My bio',
              initialAge: '',
              initialPhoneNumber: '',
              initialEmail: 'user@example.com',
            ),
      },
    );
  }
}
