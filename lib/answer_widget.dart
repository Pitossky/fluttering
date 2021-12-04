import 'package:flutter/material.dart';
import 'package:tutorial_three/quiz_model.dart';

class AnswerWidget extends StatefulWidget {
  List<Results>? resultList;
  late final int index;
  late final String answers;

  AnswerWidget(
      {required this.resultList, required this.index, required this.answers});

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  Color colorChoice = Colors.black;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {});
        if (widget.answers == widget.resultList![widget.index].correctAnswer) {
          colorChoice = Colors.green;
        } else {
          colorChoice = Colors.red;
        }
      },
      title: Text(
        widget.answers,
        textAlign: TextAlign.center,
        style: TextStyle(color: colorChoice, fontWeight: FontWeight.bold),
      ),
    );
  }
}
