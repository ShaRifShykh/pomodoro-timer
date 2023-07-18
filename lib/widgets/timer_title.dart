import 'package:flutter/material.dart';
import 'package:pomodoro/constants/sizes.dart';

class TimerTitle extends StatelessWidget {
  const TimerTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Sizes.size36,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
