import 'package:flutter/material.dart';
import 'package:pomodoro/timer.dart';

void main() {
  runApp(const Pomodoro());
}

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro App',
      theme: ThemeData(
        useMaterial3: true,
        /*  colorScheme: const ColorScheme(
          background: null,
          brightness: null,
          error: null,
          onBackground: null,
          onError: null,
          onPrimary: null,
          onSecondary: null,
          onSurface: null,
          primary: null,
          secondary: null,
          surface: null,
        ), */
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
      ),
      home: const PomodoroTimer(),
    );
  }
}
