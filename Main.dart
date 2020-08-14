import 'dart:io';

import 'Task.dart';

void main() {
  int input = 1;
  do {
    print('''To Do List
  1. View All Tasks
  2. Add Tasks
  3. Remove Task
  0. Exit''');
    print('');
    print('Select an option');
    try {
      input = int.parse(stdin.readLineSync());

      switch (input) {
        case 1:
          print('View All Tasks');
          Task.getTasks().forEach((task) => print(
              '${task.id}. Task name: ${task.taskName}, Duration: ${task.duration}, Date: ${task.date}'));
          break;
        case 2:
          print('Enter name of Task');
          String taskName = stdin.readLineSync();
          print('Enter Task id');
          int id = int.parse(stdin.readLineSync());
          print('Enter Task duration');
          dynamic duration = stdin.readLineSync();
          print('Enetr Task date');
          double date = double.parse(stdin.readLineSync());
          Task.addTask(Task(id, taskName, duration, date));
          print('$taskName created successfully');
          break;
        case 3:
          print('Enter Task id');
          int id = int.parse(stdin.readLineSync());
          Task.removeTask(id);
          print('Task removed succesfully');
          break;
        case 0:
          exit(0);
      }
    } catch (e) {
      print(e);
    }
  } while (input == 0);
}
