import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_iteam.dart';
import '../dummy_data.dart';

// ignore: use_key_in_widget_constructors
class CategoryMealScreen extends StatefulWidget {
  static String route = "CategoryMealsScreen";

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  void _removeMeal(String mealID) {}

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final title = routeArg["title"];
    final id = routeArg["id"];
    final categorymeals =
        dummymeals.where((element) => element.categories.contains(id)).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemBuilder: ((context, index) {
              return MealItem(
                  categorymeals[index].imageUrl,
                  categorymeals[index].complexity,
                  categorymeals[index].title,
                  categorymeals[index].affordability,
                  categorymeals[index].duration,
                  categorymeals[index].id,
                  _removeMeal);
            }),
            itemCount: categorymeals.length));
  }
}
