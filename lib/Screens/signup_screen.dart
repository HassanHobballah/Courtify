import 'dart:ui';

import 'package:court/pallete.dart';
import 'package:court/widgets/BackgroundImage.dart';
import 'package:court/widgets/Passwordinput.dart';
import 'package:court/widgets/RoundedButton.dart';
import 'package:court/widgets/TextInputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'firstName': _firstNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'age': _ageController.text.trim(),
        });

        // TODO: Navigate to the next screen or handle the sign up process
      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = e.message ?? 'An error occurred during sign up.';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Passwords do not match.';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/background.jpeg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.width * 0.1),
                // Profile avatar placeholder
                Center(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: CircleAvatar(
                        radius: size.width * 0.14,
                        backgroundColor: Colors.grey[400]?.withOpacity(0.5),
                        child: Icon(FontAwesomeIcons.user,
                            color: kWhite, size: size.width * 0.1),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.width * 0.1),
                // Sign up form
                Column(
                  children: [
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'First Name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      controller: _firstNameController,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'Last Name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      controller: _lastNameController,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'Age',
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                      controller: _ageController,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      controller: _emailController,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.next,
                      controller: _passwordController,
                      inputType: TextInputType.visiblePassword, // Updated here
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                      controller: _confirmPasswordController,
                      inputType: TextInputType.visiblePassword, // Updated here
                    ),
                    SizedBox(height: 30),
                    RoundedButton(
                      buttonName: 'Create Account',
                      onPressed: _signUp,
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'Login'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?',
                              style: kBodyText),
                          Text('Login',
                              style: kBodyText.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
