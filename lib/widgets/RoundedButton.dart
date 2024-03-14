import 'package:flutter/material.dart';
import '../pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName,
    this.onPressed, // Add this line
  }) : super(key: key);

  final String buttonName;
  final VoidCallback? onPressed; // Add this line

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: onPressed, // Use the onPressed parameter here
        child: Text(
          buttonName,
          style: kBodyText
              .copyWith(fontWeight: FontWeight.bold)
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
