import 'package:flutter/material.dart';

import 'category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    ///Push a new page, when back/pop it will removed.
    ///also it has a few push depending on our use cases. eg. push, pushName, pushReplacement etc
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,

        /// pass the args by using arguments with any obj
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    /// Gesture Tap with UI ripple effect
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(title,
            style: Theme.of(context).textTheme.title,
            textAlign: TextAlign.center),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle, color: Colors.grey,

          /// Creates a border radius where all radii
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
