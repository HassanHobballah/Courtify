import 'package:flutter/material.dart';
 Image logoWidget (String imageName ){
    return Image.asset(imageName, fit: BoxFit.fitWidth, width: 240);
  }
Container reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
      return Container (
          padding: const EdgeInsets.symmetric(vertical: 8.0),
  child:  TextField(

    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: false,
      
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      fillColor: Colors.white.withOpacity(0.1),
      
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
           contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
           
          
    ),
    
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  ));
}

Container signInSignUpButton(
    BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(137, 253, 253, 253);
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        islogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Color.fromARGB(221, 12, 2, 100), fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}
