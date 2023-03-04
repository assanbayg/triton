import 'package:flutter/material.dart';

class Aquarium extends StatelessWidget {
  final ThemeData theme;
  final MediaQueryData mediaQuery;

  const Aquarium({
    super.key,
    required this.theme,
    required this.mediaQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height / 2.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlue,
                Color.fromARGB(255, 192, 244, 160),
              ],
            ),
          ),
        ),
        Positioned(
          left: mediaQuery.size.width - mediaQuery.size.width * 0.5,
          bottom: mediaQuery.size.height - mediaQuery.size.height * 1.03,
          width: mediaQuery.size.width * 0.75,
          child: Image.asset('assets/images/plant2.png'),
        ),
        Positioned(
          left: mediaQuery.size.width - mediaQuery.size.width * 1.3,
          bottom: mediaQuery.size.height - mediaQuery.size.height * 1.03,
          width: mediaQuery.size.width * 0.75,
          child: Image.asset('assets/images/plant2.png'),
        ),
        Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height / 2.5,
          alignment: Alignment.bottomCenter,
          child: Image.asset('assets/images/plants.png'),
        ),
        Container(
          width: mediaQuery.size.width / 3,
          height: mediaQuery.size.height / 2.5,
          alignment: Alignment.bottomLeft,
          child: Image.asset('assets/images/plant1.png'),
        ),
      ],
    );
  }
}
