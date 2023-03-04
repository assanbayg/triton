import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Timer extends StatelessWidget {
  final MediaQueryData mediaQuery;
  const Timer({super.key, required this.mediaQuery});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: mediaQuery.size.width / 4,
      lineWidth: 15,
      percent: 0.3,
      center: Text('N minutes'),
      progressColor: Colors.green.shade900,
    );
  }
}
