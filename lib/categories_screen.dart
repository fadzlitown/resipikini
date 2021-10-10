import 'package:flutter/material.dart';

import 'category_item.dart';
import 'models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key key, @required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    /// First need to decide which view need to display
    /// ListView, GridView etc
    return GridView(
        padding: const EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map((category) =>
                CategoryItem(category.id, category.title, category.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ));
  }
}
