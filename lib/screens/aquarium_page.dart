import 'package:flutter/material.dart';

import '../widgets/timer_widget.dart';
import '../widgets/aquarium.dart';

class AquariumPage extends StatelessWidget {
  const AquariumPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TimerWidget(mediaQuery: mediaQuery),
                  SizedBox(height: mediaQuery.size.height / 33),
                  Text(
                    'Welcome back!',
                    style: theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: mediaQuery.size.height / 32),
                ],
              ),
              Aquarium(theme: theme, mediaQuery: mediaQuery),
            ],
          ),
        ),
      ),
    );
  }
}
