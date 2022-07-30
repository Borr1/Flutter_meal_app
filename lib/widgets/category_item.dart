import 'package:flutter/material.dart';
import '../screens/categories_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String id;
  final String title;

  // ignore: use_key_in_widget_constructors
  const CategoryItem(this.color, this.id, this.title);

  void selectCategory(BuildContext cntx) {
    Navigator.of(cntx).pushNamed(CategoryMealScreen.route,
        arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: color),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
