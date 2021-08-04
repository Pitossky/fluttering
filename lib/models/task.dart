
class Task {
  final String taskName;
  bool taskCompleted;

  Task({required this.taskName, this.taskCompleted = false});

  void confirmTask() {
    taskCompleted = !taskCompleted;
  }
}