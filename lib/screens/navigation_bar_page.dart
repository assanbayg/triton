import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';
import '../widgets/main_drawer.dart';
import './aquarium_page.dart';

class NavigationBarPage extends StatefulWidget {
  static const routeName = '/nav-bar';
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  var selectedIndex = 0;
  static const List<Widget> screens = [
    AquariumPage(),
    Center(),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: MyAppBar(theme: theme, mediaQuery: mediaQuery),
      drawer: MainDrawer(),
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: theme.primaryColor,
          indicatorColor: Colors.pink.shade700,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
        child: NavigationBar(
          height: 70,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) =>
              setState(() => selectedIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home_rounded,
                color: Colors.white,
              ),
              label: 'Plans',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.bar_chart_rounded,
                color: Colors.white,
              ),
              label: 'Analyses',
            ),
          ],
        ),
      ),
    );
  }
}
