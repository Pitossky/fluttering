class DateTime {
  int id;
  String day;
  String month;
  int year;

  DateTime(this.id, this.day, this.month, this.year);

  static Set<DateTime> _dates = {
    DateTime(01, 'Monday', 'August', 2020),
    DateTime(02, 'Wednesday', 'July', 2020),
    DateTime(03, 'Friday', 'April', 2020)
  };

  static void deleteDate(int id) {
    return _dates.removeWhere((date) => date.id == id);
  }
}
