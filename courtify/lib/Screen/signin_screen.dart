import 'package:courtify/Screen/signup_screen.dart';
import 'package:courtify/Screen/welcome_screen.dart';
import 'package:courtify/reusable/reusable_widget.dart';
import 'package:courtify/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("050236"),
              hexStringToColor("1801cd "),
              Color(0xff5757)
              //hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      10, MediaQuery.of(context).size.height * 0.2, 10, 0),
                  child: Column(
                    children: <Widget>[
                      logoWidget("assets/images/imae.png"),
                      const Text('COURTIFY',
                          style: TextStyle(
                              color: Color.fromARGB(255, 230, 87, 44),
                              fontSize: 30,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Enter UserName", Icons.person_outline,
                          false, _emailTextController),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Enter Password: ", Icons.lock_outline,
                          true, _passwordTextController),
                      const SizedBox(
                        height: 20,
                      ),
                      signInSignUpButton(context, true, () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()));
                        }).catchError((error) {
                          // Show the error in a Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Failed to sign in: ${error.message}"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        });
                      }),
                      SignUpOption()
                    ],
                  )),
            )));
  }

  Row SignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
