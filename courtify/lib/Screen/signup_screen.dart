// ignore_for_file: non_constant_identifier_names

import 'package:courtify/Screen/signin_screen.dart';
import 'package:courtify/reusable/reusable_widget.dart';
import 'package:courtify/utils/color_utils.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _FirstNameTextController =
      TextEditingController();
  final TextEditingController _LastNameTextController = TextEditingController();
  final TextEditingController _AgeTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("050236"),
              hexStringToColor("1801cd "),
              Color.fromARGB(0, 0, 2, 140)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.2, 20, 0),
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
                        reusableTextField(
                            "Enter your first name: ",
                            Icons.person_outline,
                            false,
                            _FirstNameTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField(
                            "Enter your last name: ",
                            Icons.person_outline,
                            false,
                            _LastNameTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter your age: ",
                            Icons.person_outline, false, _AgeTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter a valid email: ",
                            Icons.person_outline, false, _emailTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter Password: ",
                            Icons.lock_outline, true, _passwordTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        signInSignUpButton(context, false, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));
                        })
                      ],
                    )))));
  }
}
