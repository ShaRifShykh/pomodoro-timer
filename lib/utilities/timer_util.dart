String timeFormat(int seconds) {
  var duration = Duration(seconds: seconds);
  return duration.toString().split(".").first.substring(2, 7);
}

String pomodoroCountFormat(int count) {
  return count.toString();
}
