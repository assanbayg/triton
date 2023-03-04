import 'package:flutter/material.dart';

import '../widgets/aquarium.dart';
import '../widgets/timer.dart';

class AquariumPage extends StatelessWidget {
  const AquariumPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Timer(mediaQuery: mediaQuery),
                SizedBox(height: mediaQuery.size.height / 32),
                ElevatedButton(onPressed: () {}, child: Text('Set a timer')),
                SizedBox(height: mediaQuery.size.height / 32),
                Text(
                  'Welcome back!',
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
            Aquarium(theme: theme, mediaQuery: mediaQuery),
          ],
        ),
      ),
    );
  }
}
