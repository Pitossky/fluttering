class Task {
  int id = 0;
  String taskName;
  dynamic duration;
  double date;

  Task(this.id, this.taskName, this.duration, this.date);

  static Task taskOne = Task(1, 'Swimming', '30min', 12.08);
  static Task taskTwo = Task(2, 'Running', '45min', 13.09);
  static Task taskThree = Task(3, 'Cooking', '25min', 20.01);

  static Set<Task> tasks = {
    Task(1, 'Swimming', '30min', 12.08),
    Task(2, 'Running', '45min', 13.09),
    Task(3, 'Cooking', '25min', 20.01)
  };

  static void addTask(Task newTask) {
    tasks.add(newTask);
  }

  static void removeTask(int id) {
    return tasks.removeWhere((task) => task.id == id);
  }

  static Task showTask(int id) {
    return tasks.firstWhere((task) => task.id == id);
  }

  static Set<Task> getTasks() {
    return tasks;
  }

  @override
  String toString() {
    // ignore: todo
    // TODO: implement toString
    return "Task: $id, $taskName, $duration, $date";
  }
}
