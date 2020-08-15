import 'Date.dart';

class Task {
  int id = 0;
  String taskName;
  String duration;
  dynamic taskDay;
  dynamic taskMonth;
  int taskYear;

  Task(this.id, this.taskName, this.duration, this.taskDay, this.taskMonth,
      this.taskYear);

  static DateTime dayOne = DateTime(01, 'Monday', 'August', 2020);
  static DateTime dayTwo = DateTime(02, 'Wednesday', 'July', 2020);
  static DateTime dayThree = DateTime(03, 'Friday', 'April', 2020);

  static Task taskOne =
      Task(1, 'Swimming', '30min', dayOne.day, dayOne.month, dayOne.year);
  static Task taskTwo =
      Task(2, 'Running', '45min', dayTwo.day, dayTwo.month, dayTwo.year);
  static Task taskThree =
      Task(3, 'Cooking', '25min', dayThree.day, dayThree.month, dayThree.year);

  static Set<Task> tasks = {
    Task(1, 'Swimming', '30min', dayOne.day, dayOne.month, dayOne.year),
    Task(2, 'Running', '45min', dayTwo.day, dayTwo.month, dayTwo.year),
    Task(3, 'Cooking', '25min', dayThree.day, dayThree.month, dayThree.year)
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
    return "Task: $id, $taskName, $duration, $taskDay, $taskMonth, $taskYear";
  }
}
