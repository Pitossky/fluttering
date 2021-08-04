import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.taskName,
            isChecked: task.taskCompleted,
            checkboxFunction: (newValue) {
              taskData.updateTask(task);
            },
            longPressFunction: () {
              taskData.deleteTask(task);
            },
          );
        },
          itemCount: taskData.taskLength,
        );
      },
    );
  }
}