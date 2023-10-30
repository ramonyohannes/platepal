import 'package:flutter/material.dart';
import 'package:platepal_app/screens/filters_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  Widget _buildListTile(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Theme.of(context).primaryColorLight,
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 30),
              child: Text(
                "Cook Up!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildListTile(Icons.restaurant, "Categories", () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          const SizedBox(height: 10),
          _buildListTile(Icons.settings, "Favorites", () {
            Navigator.of(context).pushReplacementNamed(Filters.filtersRoute);
          }),
        ],
      ),
    );
  }
}
