import 'package:court/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pallete.dart';
import '../widgets/BackgroundImage.dart';
import '../widgets/RoundedButton.dart';
import '../widgets/TextInputField.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final AuthService _authService = AuthService(); // Instance of AuthService
  bool _isLoading = false;
  String _message = '';

  void sendPasswordResetEmail() async {
    setState(() {
      _isLoading = true;
      _message = '';
    });

    try {
      await _authService.sendPasswordResetEmail(_emailController.text);
      setState(() {
        _message = 'Check your email for reset instructions.';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _message = e.message ?? 'An error occurred. Please try again.';
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
        const BackgroundImage(
            image:
                'assets/images/login_bg.png'), // Ensure the image path is correct
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: kWhite),
            ),
            title: const Text('Forgot Password', style: kBodyText),
            centerTitle: true,
          ),
          body: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              Container(
                width: size.width * 0.8,
                child: const Text(
                  'Enter your email and we will send instructions to reset your password',
                  style: kBodyText,
                ),
              ),
              const SizedBox(height: 20),
              TextInputField(
                icon: FontAwesomeIcons.envelope,
                hint: 'Email',
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.done,
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              RoundedButton(
                buttonName: 'Send',
                onPressed:
                    sendPasswordResetEmail, // Call the method to send reset email
              ),
              SizedBox(height: 20),
              Text(_message,
                  style: TextStyle(color: Colors.red)), // Display the message
            ],
          ),
        ),
      ],
    );
  }
}
