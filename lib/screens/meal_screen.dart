import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';

// ignore: use_key_in_widget_constructors
class MealScreen extends StatelessWidget {
  static String route = "MealScreen";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;

    final Meal meal = dummymeals.firstWhere(
      (element) => element.id == id,
    );

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      drawer: MainDrawer(),
      // ignore: sized_box_for_whitespace
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          width: double.infinity,
          child: Column(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Ingredients : ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                width: 300,
                height: 150,
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                  itemBuilder: ((context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).primaryColor,
                        ),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(meal.ingredients[index]),
                      )),
                  itemCount: meal.ingredients.length,
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Steps : ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                height: 150,
                width: 300,
                child: ListView.builder(
                  itemBuilder: ((context, index) => Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(meal.steps[index]),
                      )),
                  itemCount: meal.steps.length,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
