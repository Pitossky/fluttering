import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';


class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String? newTaskTitle;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlueAccent,
            ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                  newTaskTitle = newText;
              },
            ),
            FlatButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addNewTask(newTaskTitle!);
                Navigator.pop(context);
              },
              child: Text('Add',
              style: TextStyle(
                color: Colors.white,
              ),),
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
