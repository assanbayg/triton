import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
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
              'Account',
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
        buildListTile('Aquarium', Icons.check_box_outline_blank_sharp,
            () => Navigator.of(context).pushReplacementNamed('/')),
        buildListTile('Notifications', Icons.notifications,
            () => Navigator.of(context).pushReplacementNamed('/')),
        buildListTile('Filters', Icons.settings, () => print('')),
      ]),
    );
  }
}
