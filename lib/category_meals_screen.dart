import 'package:flutter/material.dart';
import 'package:resipikini/meal_item.dart';
import 'package:resipikini/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> mealList;

  CategoryMealsScreen(this.mealList);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var _hasLoadedData = false;
  String appbarTitle;
  List<Meal> list;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_hasLoadedData) {
      /// This screen is expecting args
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      appbarTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      list = widget.mealList.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      _hasLoadedData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle),
      ),
      body: ListView.builder(
        /// itemBuilder = Widget Function(BuildContext context, int index);
        itemBuilder: (ctx, pos) {
          return MealItem(list[pos]);
        },
        itemCount: list.length,
      ),
    );
  }
}
