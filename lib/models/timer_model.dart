import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

enum PomodoroMode { working, resting }

class TimerModel extends ChangeNotifier {
  static const _defaultWorkSeconds = 1500;
  static const _defaultRestSeconds = 300;
  static const _defaultPomodoroCount = 0;
  late int _workSeonds;
  late int _restSeconds;
  late int _timerSeconds;
  late int _pomodoroCount;
  late Timer _timer;
  late bool _isRunning;
  late PomodoroMode _status;

  set pomodoroStatus(PomodoroMode status) {
    _status = status;
  }

  bool get isRunning => _isRunning;
  int get pomodoroCount => _pomodoroCount;
  int get timerSeconds => _timerSeconds;

  TimerModel() {
    _isRunning = false;
    _status = PomodoroMode.working;
    _workSeonds = _defaultWorkSeconds;
    _restSeconds = _defaultRestSeconds;
    _timerSeconds = _workSeonds;
    _pomodoroCount = _defaultPomodoroCount;
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

  void updateTime(int time, PomodoroMode mode) {
    if (mode == PomodoroMode.working) {
      _workSeonds = time;
    } else if (mode == PomodoroMode.resting) {
      _restSeconds = time;
    }

    _isRunning = false;

    _timerSeconds = _workSeonds;
    _status = PomodoroMode.working;
    _pomodoroCount = _defaultPomodoroCount;

    notifyListeners();
  }

  void _onTick(Timer timer) {
    if (_timerSeconds == 0 && _isRunning) {
      if (_status == PomodoroMode.working) {
        _status = PomodoroMode.resting;
        _pomodoroCount++;
        _timerSeconds = _restSeconds;
        _workFinshAudio();
      } else if (_status == PomodoroMode.resting) {
        _status = PomodoroMode.working;
        _timerSeconds = _workSeonds;
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
      onToggleStartPause();
    }

    _isRunning = false;

    _timerSeconds = _workSeonds;
    _status = PomodoroMode.working;
    _pomodoroCount = _defaultPomodoroCount;

    notifyListeners();
  }
}
