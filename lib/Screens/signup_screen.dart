import 'dart:ui';

import 'package:court/Screens/login_screen.dart';
import 'package:court/pallete.dart';
import 'package:court/widgets/Passwordinput.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/BackgroundImage.dart';
import '../widgets/RoundedButton.dart';
import '../widgets/TextInputField.dart';

class SignUp extends StatelessWidget {
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
                Stack(children: [
                  Center(
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX:4, sigmaY: 4),
                        child: CircleAvatar(
                          radius: size.width * 0.14,
                          backgroundColor: Colors.grey[400]?.withOpacity(0.5),
                          child: Icon(FontAwesomeIcons.user,
                              color: kWhite, size: size.width * 0.1),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top : size.height*0.08,
                  //   left: size.width*0.56,
            
                  //   child: Container(
                  //     height: size.width*0.1,
                  //     width: size.width * 0.1,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         shape: BoxShape.circle,
                  //         border: Border.all(color: kWhite, width: 2),
                          
                  //         ),
                  //         child: const Icon(FontAwesomeIcons.arrowUp,color: kWhite,),
                  //   ),
                  // )
                ]
                ),
                SizedBox(height: size.width * 0.1),
                 Column(children: [
                  TextInputField(icon: FontAwesomeIcons.user, hint: 'First Name', inputType: TextInputType.name, inputAction: TextInputAction.next),
                  TextInputField(icon: FontAwesomeIcons.user, hint: 'Last Name', inputType: TextInputType.name, inputAction: TextInputAction.next),
                  TextInputField(icon: FontAwesomeIcons.user, hint: 'Age', inputType: TextInputType.number, inputAction: TextInputAction.next),
                  TextInputField(icon: FontAwesomeIcons.envelope, hint: 'Email', inputType: TextInputType.emailAddress, inputAction: TextInputAction.done),
                  Passwordinput(icon: FontAwesomeIcons.lock, hint: 'Password', inputType: TextInputType.text, inputAction: TextInputAction.next),
                   Passwordinput(icon: FontAwesomeIcons.lock, hint: 'Confirm Password', inputType: TextInputType.text, inputAction: TextInputAction.done),
                   SizedBox(height: 30),
                   RoundedButton(buttonName: 'Create Account'),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'Login'),
                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?',style: kBodyText),
                          Text('Login',style: kBodyText.copyWith(color: Colors.white,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
            
                ],)
              ],
            ),
          ),
        ),
      ],
    );
  }
}