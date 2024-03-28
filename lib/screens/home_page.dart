import 'package:flutter/material.dart';
import 'package:pomodoro/constants/sizes.dart';
import 'package:pomodoro/models/timer_model.dart';
import 'package:pomodoro/screens/settings_page.dart';
import 'package:pomodoro/utilities/timer_util.dart';
import 'package:pomodoro/widgets/reset_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TimerModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingPage(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.primary,
                    size: Sizes.size32,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Consumer<TimerModel>(
        builder: (context, timer, child) {
          return Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    timeFormat(timer.timerSeconds),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: timer.timerSeconds > 3599
                          ? Sizes.size80
                          : Sizes.size96,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: Sizes.size32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: Sizes.size96 + Sizes.size24,
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: model.onToggleStartPause,
                          icon: Icon(timer.isRunning
                              ? Icons.pause_circle_outline
                              : Icons.play_circle_outline),
                        ),
                        const ResetButton()
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pomodoros",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' ${pomodoroCountFormat(timer.pomodoroCount)}',
                        style: TextStyle(
                          fontSize: 58,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
