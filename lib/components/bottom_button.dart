import 'package:flutter/material.dart';
import '../constants.dart';


class BottomButton extends StatelessWidget {
  BottomButton({required this.whenPressed, required this.buttonText});

  final VoidCallback whenPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenPressed,
      child: Container(
        child: Center(
          child: Text(buttonText,
            style: kBottomContainerTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}