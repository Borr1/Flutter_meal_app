import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters.dart';

// ignore: use_key_in_widget_constructors
class MainDrawer extends StatelessWidget {
  Widget listTileBuilder(
      BuildContext buildContext, String title, Icon icon, String route) {
    return ListTile(
      onTap: () {
        Navigator.of(buildContext).pushReplacementNamed(route);
      },
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontSize: 25, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 140,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: const Text(
              "COOKING UP !",
              style: TextStyle(
                  color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          listTileBuilder(context, "meals", const Icon(Icons.restaurant), "/"),
          listTileBuilder(
              context, "filters", const Icon(Icons.settings), Filters.route)
        ],
      ),
    );
  }
}
