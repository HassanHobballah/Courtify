import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courtify/Screen/welcome_screen.dart';
import 'package:courtify/reusable/reusable_widget.dart';
import 'package:courtify/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _ageTextController.dispose();
    super.dispose();
  }

  Future<void> signUpUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextController.text.trim(),
        password: _passwordTextController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'firstName': _firstNameTextController.text.trim(),
        'lastName': _lastNameTextController.text.trim(),
        'age': _ageTextController.text.trim(),
        // You can add more user info fields here if needed.
      });

      // Navigate to the WelcomeScreen upon successful sign-up and Firestore update.
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    } on FirebaseAuthException catch (authError) {
      _showError(authError.message ?? "Failed to sign up.");
    } on FirebaseException catch (firestoreError) {
      _showError(firestoreError.message ?? "Failed to store user data.");
    } catch (e) {
      _showError("An unexpected error occurred.");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

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
          gradient: LinearGradient(
            colors: [
              hexStringToColor("050236"),
              hexStringToColor("1801cd"),
              const Color.fromARGB(0, 0, 2, 140)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget(
                    "assets/images/imae.png"), // make sure the asset path is correct
                const SizedBox(height: 30),
                reusableTextField(
                  "Enter your first name",
                  Icons.person_outline,
                  false,
                  _firstNameTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter your last name",
                  Icons.person_outline,
                  false,
                  _lastNameTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter your age",
                  Icons.person_outline,
                  false,
                  _ageTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter a valid email",
                  Icons.email_outlined,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(height: 20),
                signInSignUpButton(context, false, signUpUser),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
