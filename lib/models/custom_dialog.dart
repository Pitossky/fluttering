import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText = "Reset";

  CustomDialog(
      {required this.title, required this.content, required this.callback});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(
          onPressed: callback,
          child: Text(actionText),
          color: Colors.white,
        ),
      ],
    );
  }
}
