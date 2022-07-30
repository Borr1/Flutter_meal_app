import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters.dart';
import './screens/categories_meal_screen.dart';
import './screens/meal_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext buildcontext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meal App",
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          canvasColor: Colors.grey,
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                  color: Colors.white,
                  fontFamily: "RobotoCondensed",
                  fontSize: 20))),
      initialRoute: "/",
      routes: {
        "/": (context) => TabsScreen(),
        Filters.route: ((context) => Filters()),
        CategoryMealScreen.route: (context) => CategoryMealScreen(),
        MealScreen.route: ((context) => MealScreen())
      },
    );
  }
}
