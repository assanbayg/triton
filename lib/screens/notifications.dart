import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  static const routeName = '/notifications';
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    var i = 0, j = 0;
    Widget buildListTile(String title, String subtitle) {
      setState(() {
        i++;
      });
      return ListTile(
        leading: CircleAvatar(child: Text(i.toString())),
        title: Text(
          title,
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall,
        ),
      );
    }

    Widget buildAchievmentsTile(String title, String subtitle) {
      setState(() {
        j++;
      });
      return ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.pink.shade600, child: Text(j.toString())),
        title: Text(
          title,
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall,
        ),
      );
    }

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text('Notifications',
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: mediaQuery.size.height * 0.025),
              Container(
                width: mediaQuery.size.width * 0.8,
                height: mediaQuery.size.height * 0.7,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    buildListTile(
                        'You finished 50 minutes focus!', 'Great job!'),
                    buildListTile(
                        'You finished 50 minutes focus!', 'Great job!'),
                    buildListTile(
                        'You finished 50 minutes focus!', 'Great job!'),
                    Container(
                      height: 2,
                      width: mediaQuery.size.width / 1.5,
                      margin: const EdgeInsets.symmetric(vertical: 50),
                      color: Colors.grey,
                    ),
                    buildAchievmentsTile(
                        'You are invited to Harvard graduate meeting',
                        'It is going to be 13.12.23 in Smart Point'),
                    buildAchievmentsTile(
                        'You unlocked an andrias, a biggest newt',
                        'It is goiing to be added in your aquarium'),
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
