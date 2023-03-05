import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart'
    show CircularPercentIndicator;

class TimerWidget extends StatefulWidget {
  final MediaQueryData mediaQuery;
  const TimerWidget({super.key, required this.mediaQuery});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _timerDuration = 30; // Duration in minutes
  int _elapsedSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_elapsedSeconds < _timerDuration * 60) {
          _elapsedSeconds++;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      _elapsedSeconds = 0;
    });
  }

  void setTimerDuration() async {
    final newDuration = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Set Timer Duration'),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter duration in minutes',
                    ),
                    onSubmitted: (value) {
                      Navigator.pop(
                          context, int.tryParse(value) ?? _timerDuration);
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, _timerDuration);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
    setState(() {
      _timerDuration = newDuration as int;
      _elapsedSeconds = 0;
    });
  }

  String get timerDisplayString {
    int remainingSeconds = (_timerDuration * 60) - _elapsedSeconds;
    String minutesStr = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    String secondsStr = (remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  double get percentComplete {
    return _elapsedSeconds / (_timerDuration * 60);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: setTimerDuration,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: widget.mediaQuery.size.width / 4,
              lineWidth: 10.0,
              percent: percentComplete,
              center: Text(
                timerDisplayString,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              progressColor: Colors.green.shade900,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text('Start'),
                ),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
