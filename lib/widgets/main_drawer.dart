import 'dart:io';

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(fontFamily: 'RobotoCondenced'),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Coocking Up!',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          const Divider(),
          buildListTile('Meals', Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed('/')),
          buildListTile('Filters', Icons.filter,
              () => Navigator.of(context).pushReplacementNamed('/filters')),
          buildListTile('Exit', Icons.exit_to_app, () => exit(0)),
        ],
      ),
    );
  }
}
