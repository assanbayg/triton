import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final ThemeData theme;
  final MediaQueryData mediaQuery;

  const MyAppBar({
    super.key,
    required this.theme,
    required this.mediaQuery,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }
}
