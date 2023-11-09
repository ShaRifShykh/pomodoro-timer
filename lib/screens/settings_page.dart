import 'package:flutter/material.dart';
import 'package:pomodoro/models/timer_model.dart';
import 'package:pomodoro/widgets/time_setting.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<TimerModel>(
        builder: (context, value, child) {
          return SafeArea(
            child: ListView(
              children: const [
                TimeSetter(
                    title: "Update work time.", status: PomodoroMode.working),
                TimeSetter(
                    title: "Update break time.", status: PomodoroMode.resting),
                AboutListTile(
                  applicationVersion: "1.0",
                  applicationLegalese: "Don't copy me.",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
