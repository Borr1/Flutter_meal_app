// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final Complexity complexity;
  final String title;
  final Affordability affordability;
  final int duration;
  final String id;
  final Function removeItem;
  const MealItem(this.imageUrl, this.complexity, this.title, this.affordability,
      this.duration, this.id, this.removeItem);

  String get complexityText {
    switch (complexity) {
      case Complexity.hard:
        return "hard";
        break;
      case Complexity.challenging:
        return "challenging";
        break;
      case Complexity.simple:
        return "simple";
        break;
      default:
        return "chay";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "affordable";
        break;
      case Affordability.luxerious:
        return "luxerious";
        break;
      case Affordability.pricey:
        return "pricey";
        break;
      default:
        return "asba";
    }
  }

  void navMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealScreen.route, arguments: id)
        .then((value) {
      if (value != null) removeItem(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => navMeal(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      color: Colors.black45,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(affordabilityText)
                    ],
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
