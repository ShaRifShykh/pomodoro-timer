import 'package:flutter/material.dart';
import 'package:pomodoro/constants/features/timer.dart';

void main() {
  runApp(const Pomodoro());
}

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pomodoro',
      themeMode: ThemeMode.system,
      home: Timer(),
    );
  }
}
