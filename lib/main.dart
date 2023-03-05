import 'package:flutter/material.dart';

import './theme.dart';
import './screens/navigation_bar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Triton',
      theme: basisTheme(),
      home: const NavigationBarPage(),
      initialRoute: '/',
      routes: {
        NavigationBarPage.routeName: (context) => const NavigationBarPage(),
      },
    );
  }
}
