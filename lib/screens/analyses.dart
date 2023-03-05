import 'package:flutter/material.dart';

class AnalysesPage extends StatelessWidget {
  static const routeName = '/notifications';
  const AnalysesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Notifications',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
