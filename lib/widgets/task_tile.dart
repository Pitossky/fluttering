import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxFunction;
  final Function() longPressFunction;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxFunction,
      required this.longPressFunction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressFunction,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxFunction,
      ),
    );
  }
}
