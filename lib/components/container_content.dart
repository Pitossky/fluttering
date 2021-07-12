import 'package:flutter/material.dart';
import '../constants.dart';

class ContainerContent extends StatelessWidget {
  ContainerContent(
      {required this.containerSymbol, required this.containerText});

  final IconData containerSymbol;
  final String containerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          containerSymbol,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          containerText,
          style: kContainerTextStyle,
        ),
      ],
    );
  }
}