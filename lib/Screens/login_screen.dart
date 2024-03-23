import 'package:court/Services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:court/main_layout.dart';
import 'package:court/widgets/BackgroundImage.dart';
import 'package:court/widgets/RoundedButton.dart';
import 'package:court/widgets/TextInputField.dart';
import 'package:court/widgets/PasswordInput.dart'; // Ensure this is correctly imported
import '../pallete.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String _errorMessage = '';

  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final userCredential = await _authService.signInWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
    );

    if (userCredential?.user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const MainLayout()), // Ensure MainLayout is the correct import for your navigation target
      );
    } else {
      setState(() {
        _errorMessage = 'Login failed. Please try again.';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
          image:
              'assets/images/Background.jpeg', // Ensure the image path is correct
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'Courtify', // Replace with your app name
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                    inputAction: TextInputAction.done,
                    controller: _passwordController,
                    inputType: TextInputType.visiblePassword,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context,
                        'ForgotPassword'), // Ensure this navigates correctly
                    child: const Text(
                      'Forgot Password?',
                      style: kBodyText,
                    ),
                  ),
                  const SizedBox(height: 25),
                  _isLoading
                      ? CircularProgressIndicator()
                      : GestureDetector(
                          onTap: _login,
                          child: const RoundedButton(buttonName: 'Login'),
                        ),
                  const SizedBox(height: 25),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context,
                    '/createNewAccount'), // Ensure this navigates correctly
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white)),
                  ),
                  child: const Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Display error message if login failed
              Text(_errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 14)),
            ],
          ),
        )
      ],
    );
  }
}
