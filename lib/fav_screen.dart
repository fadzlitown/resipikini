import 'package:flutter/material.dart';

import 'meal_item.dart';
import 'models/meal.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> favMeals;

  FavScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(favMeals[index]);
      },
      itemCount: favMeals.length,
    );
  }
}
