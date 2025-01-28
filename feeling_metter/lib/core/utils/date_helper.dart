import 'package:intl/intl.dart';

String getCurrentDayAndMonth() {
  DateTime now = DateTime.now(); // Default device time
  return DateFormat('dd MMMM').format(now);
}

String getCurrentTime() {
  DateTime now = DateTime.now(); // Default device time
  return DateFormat('hh:mm a').format(now);
}

String getCurrentTimeWithOffset(int offsetHours) {
  DateTime now = DateTime.now().toUtc().add(Duration(hours: offsetHours)); // Adjust time by offset
  return DateFormat('hh:mm a').format(now);
}
