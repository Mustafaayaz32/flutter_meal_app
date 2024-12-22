import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.selectDrawerItem});

  final void Function(String identifier) selectDrawerItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Row(
              children: [
                Icon(Icons.restaurant),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Cooking Up!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Meals'),
            onTap: () {
              selectDrawerItem('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Filters'),
            onTap: () {
              selectDrawerItem('filters');
            },
          ),
        ],
      ),
    );
  }
}
