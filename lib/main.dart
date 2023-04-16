import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './theme.dart';
import './screens/navigation_bar_page.dart';
import './screens/aquarium_page.dart';
import './screens/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
        AquariumPage.routeName: (context) => const AquariumPage(),
        TodoPage.routeName: (context) => TodoPage(),
      },
    );
  }
}
