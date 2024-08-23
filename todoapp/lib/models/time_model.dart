DateTime getDateTime(int hourTask, int minuteTask) {
  return DateTime(
      DateTime.now().year, // Current year
      DateTime.now().month, // Current month
      DateTime.now().day, // Current day
      hourTask, // Task hour (24-hour format)
      minuteTask // Task minute
      );
}
