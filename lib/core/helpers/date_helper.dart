class DateHelper {
  static DateTime currentDate = DateTime.now();
  static String getDayName(int weekday) {
    const List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return days[weekday - 1]; // Subtract 1 because `weekday` starts from 1
  }
}
