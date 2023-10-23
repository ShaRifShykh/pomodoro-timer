import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

enum PomodoroMode { working, resting }

class TimerModel extends ChangeNotifier {
  static const _defaultWorkSeconds = 1500;
  static const _defaultRestSeconds = 300;
  static const _defaultPomodoroCount = 0;
  late int _timerSeconds;
  late int _pomodoroCount;
  late Timer _timer;
  late bool _isRunning;
  late PomodoroMode _status;

  PomodoroMode get status => _status;
  bool get isRunning => _isRunning;
  int get pomodoroCount => _pomodoroCount;
  int get timerSeconds => _timerSeconds;

  TimerModel() {
    _timerSeconds = _defaultWorkSeconds;
    _pomodoroCount = _defaultPomodoroCount;
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  final player = AudioPlayer();

  void _workFinshAudio() async {
    await player.setAsset("assets/audio/mixkit-alarm-tone-996.wav");
    player.play();
  }

  void _restFinshAudio() async {
    await player.setAsset("assets/audio/mixkit-classic-alarm-995.wav");
    player.play();
  }

  void _onTick(Timer timer) {
    if (_timerSeconds == 0 && !_isRunning) {
      if (_status == PomodoroMode.working) {
        _status = PomodoroMode.resting;
        _pomodoroCount++;
        _timerSeconds = _defaultRestSeconds;
        _workFinshAudio();
      } else if (_status == PomodoroMode.resting) {
        _status = PomodoroMode.working;
        _timerSeconds = _defaultWorkSeconds;
        _restFinshAudio();
      }
    } else {
      _timerSeconds--;
    }
    notifyListeners();
  }

  void onToggleStartPause() {
    if (_isRunning &&
        (_status == PomodoroMode.working || _status == PomodoroMode.resting)) {
      _isRunning = false;
      _timer.cancel();
    } else {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
    }
    notifyListeners();
  }

  void onResetPressed() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
    }

    if (_status == PomodoroMode.working) {
      _timerSeconds = _defaultWorkSeconds;
    } else if (_status == PomodoroMode.resting) {
      _timerSeconds = _defaultRestSeconds;
    }

    _pomodoroCount = _defaultPomodoroCount;
    notifyListeners();
  }
}
