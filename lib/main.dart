import 'package:flutter/material.dart';
import 'package:resipikini/category_meals_screen.dart';
import 'package:resipikini/meal_detail_screen.dart';
import 'package:resipikini/tabs_screen.dart';

import 'categories_screen.dart';
import 'const.dart' as globals;
import 'models/dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [DUMMY_MEALS.first, DUMMY_MEALS.last];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: globals.Const.FONT_FAMILY_RALEYWAY,
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Colors.orange),
                body2: TextStyle(color: Colors.orangeAccent),
                title: TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 17,
                  fontFamily: globals.Const.FONT_FAMILY_ROBOTO,
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: TabsScreen(title: globals.Const.APP_NAME, favMeals: _favoriteMeals),
      initialRoute: '/',
      routes: {
        '/': (ctx) =>
            TabsScreen(title: globals.Const.APP_NAME, favMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(title: "Categories Screen"),
        );
      },
    );
  }
}
