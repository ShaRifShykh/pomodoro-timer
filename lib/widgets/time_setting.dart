import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/models/timer_model.dart';
import 'package:provider/provider.dart';

class TimeSetter extends StatefulWidget {
  const TimeSetter({
    super.key,
    required this.title,
    required this.status,
  });

  final String title;
  final PomodoroMode status;

  @override
  State<TimeSetter> createState() => _TimeSetterState();
}

class _TimeSetterState extends State<TimeSetter> {
  void _showDialog(BuildContext context) {
    Duration initialtimer = const Duration();
    showCupertinoModalPopup(
      context: context,
      builder: (builder) {
        return SizedBox(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: SizedBox.expand(
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hms,
                initialTimerDuration: initialtimer,
                onTimerDurationChanged: (Duration changedtimer) {
                  setState(() {
                    initialtimer = changedtimer;
                  });
                },
              ),
            ));
      },
    ).whenComplete(() {
      final model = Provider.of<TimerModel>(context, listen: false);
      model.updateTime(initialtimer.inSeconds, widget.status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _showDialog(context),
      leading: const Icon(Icons.timer),
      title: Text(
        widget.title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
