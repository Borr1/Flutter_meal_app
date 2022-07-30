import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

// ignore: use_key_in_widget_constructors
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 100,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10),
          children: dummycategories
              .map((e) => CategoryItem(e.color, e.id, e.title))
              .toList()),
    );
  }
}
