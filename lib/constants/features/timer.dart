import 'package:flutter/material.dart';
import 'package:pomodoro/constants/sizes.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Text("Content"),
            ],
          ),
        ),
      ),
    );
  }
}
