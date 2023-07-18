import 'package:flutter/material.dart';
import 'package:pomodoro/theme.dart';
import 'package:pomodoro/screens/timer.dart';

void main() {
  runApp(const Pomodoro());
}

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro App',
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: const PomodoroTimer(),
    );
  }
}
