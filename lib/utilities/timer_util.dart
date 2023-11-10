String timeFormat(int seconds) {
  var duration = Duration(seconds: seconds);
  if (seconds > 3599) {
    return duration.toString().split(".").first.substring(0, 8);
  }
  return duration.toString().split(".").first.substring(2, 7);
}

String pomodoroCountFormat(int count) {
  return count.toString();
}
