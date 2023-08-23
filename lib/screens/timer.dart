import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/constants/sizes.dart';
import 'package:pomodoro/utilities/timer_util.dart';
import 'package:pomodoro/widgets/timer_header.dart';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});

  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  static const _defaultWorkSeconds = 3;
  static const _defaultRestSeconds = 3;
  static const _defaultPomodoroCount = 0;
  int _remainWorkSeconds = _defaultWorkSeconds;
  int _remainRestSeconds = _defaultRestSeconds;
  int _totalPomodoroCount = _defaultPomodoroCount;
  bool _isRunning = false;
  bool _isResting = false;
  late Timer _timer;

  void _onTick(Timer timer) {
    if (_remainWorkSeconds == 0) {
      if (_remainRestSeconds != 0) {
        setState(() {
          if (!_isResting) {
            _totalPomodoroCount = _totalPomodoroCount + 1;
          }
          _isResting = true;
          _remainRestSeconds = _remainRestSeconds - 1;
        });
      } else {
        setState(() {
          _isResting = false;
          _remainWorkSeconds = _defaultWorkSeconds;
          _remainRestSeconds = _defaultRestSeconds;
        });
      }
    } else {
      setState(() {
        _remainWorkSeconds = _remainWorkSeconds - 1;
      });
    }
  }

  void _onStartPressed() {
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
    setState(() {
      _isRunning = true;
    });
  }

  void _onPausePressed() {
    setState(() {
      _timer.cancel();
      _isRunning = false;
    });
  }

  void _onResetPressed() {
    setState(() {
      _timer.cancel();
      _isRunning = false;
      _isResting = false;
      _remainWorkSeconds = _defaultWorkSeconds;
      _remainRestSeconds = _defaultRestSeconds;
      _totalPomodoroCount = _defaultPomodoroCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            if (_isResting) const TimerTitle(text: "Resting"),
            if (!_isResting) const TimerTitle(text: "Running"),
            Text(
              timeFormat(_isResting ? _remainRestSeconds : _remainWorkSeconds),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Sizes.size96,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Pomodoro Count: ${pomodoroCountFormat(_totalPomodoroCount)}",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Sizes.size36,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: Sizes.size96 + Sizes.size24,
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: _isRunning ? _onPausePressed : _onStartPressed,
                  icon: Icon(_isRunning
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline),
                ),
                if (!_isResting)
                  IconButton(
                    iconSize: Sizes.size96 + Sizes.size24,
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: _onResetPressed,
                    icon: const Icon(
                      Icons.replay_rounded,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
