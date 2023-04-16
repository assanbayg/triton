import 'package:flutter/material.dart';

import '../screens/notifications.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, Function()? tapHandler) {
    return ListTile(
      title: Text(
        title,
      ),
      leading: Icon(icon, size: 26),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Theme.of(context).primaryColor,
          child: ListTile(
            title: const Text(
              'Қолданушы',
              style: TextStyle(color: Colors.white),
            ),
            leading: const Icon(
              Icons.account_circle_outlined,
              size: 26,
              color: Colors.white,
            ),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 20),
        buildListTile('Аквариум', Icons.check_box_outline_blank_sharp,
            () => Navigator.of(context).pushReplacementNamed('/')),
        buildListTile('Хабарламалар', Icons.notifications,
            () => Navigator.of(context).pushNamed(Notifications.routeName)),
        buildListTile('Баптаулар', Icons.settings, () => null),
      ]),
    );
  }
}
