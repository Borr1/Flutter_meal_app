import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

// ignore: use_key_in_widget_constructors
class Filters extends StatelessWidget {
  static String route = "filters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: const Text("Filters"),
    );
  }
}
