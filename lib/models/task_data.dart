import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  final List<Task> _tasks = [
    Task(taskName: 'Buy Milk'),
    Task(taskName: 'Buy eggs'),
    Task(taskName: 'Go to the Gym'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskLength => _tasks.length;

  void addNewTask(String newTaskTitle) {
    final task = Task(taskName: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.confirmTask();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}