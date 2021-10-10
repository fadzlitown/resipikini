import 'package:flutter/material.dart';

import 'enum/affordability.dart';
import 'enum/complexity.dart';
import 'models/meal.dart';

class MealItem extends StatelessWidget {
  Meal meal;

  MealItem(Meal meal) {
    this.meal = meal;
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ///ClipRRect = Creates a rounded-  rectangular clip right-angled corners
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              meal.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Text(meal.title,
                style: TextStyle(fontSize: 20, color: Colors.black),

                ///Whether the text should break at soft line breaks
                softWrap: true,

                ///Fade the overflowing text to transparent.
                overflow: TextOverflow.fade),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.schedule,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(meal.duration.toString() + "min"),
                  ],
                ),
                Row(children: [
                  Icon(
                    Icons.work,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(complexityText),
                ]),
                Row(children: [
                  Icon(
                    Icons.attach_money,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(affordabilityText),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
