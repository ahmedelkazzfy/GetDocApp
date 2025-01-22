class DateManager {
  // Get the current date
  DateTime get currentDate => DateTime.now();

  // Format the date as a string
  String get formattedDate =>
      "${currentDate.year}-${currentDate.month}-${currentDate.day}";
}
