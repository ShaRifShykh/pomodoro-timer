String timeFormat(int seconds) {
  var duration = Duration(seconds: seconds);
  return duration.toString().split(".").first.substring(2, 7);
}
