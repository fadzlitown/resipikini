import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'const.dart' as globals;
import 'fav_screen.dart';
import 'filter_screen.dart';
import 'models/meal.dart';

/// This Tabs Screen required a state to saved in app
/// eg. init pages, list meals. Hence, StatefulWidget is needed
class TabsScreen extends StatefulWidget {
  String title;
  final List<Meal> favMeals;

  @override
  _TabsScreenState createState() => _TabsScreenState();

  TabsScreen({this.title, this.favMeals});
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    //load data
    _pages = [
      {
        'page': CategoriesScreen(title: widget.title),
        'title': globals.Const.PAGE_1
      },
      {'page': FavScreen(widget.favMeals), 'title': globals.Const.PAGE_2}
    ];
    super.initState();
  }

  void _selectedPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// any widget screen needs to wrap with Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_selectedPageIndex == 0)
            IconButton(
                padding: EdgeInsets.all(6),
                alignment: Alignment.centerRight,
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).pushNamed(FilterScreen.routeName);
                }),
          Expanded(
              child: Container(
            child: _pages[_selectedPageIndex]['page'],
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        ///call this to rebuild the navigation bar with the new [_selectedPageIndex]
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: _tabsConfiguration(context),
      ),
    );
  }

  _tabsConfiguration(BuildContext context) {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text(globals.Const.PAGE_1),
          backgroundColor: Theme.of(context).primaryColor),
      BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text(globals.Const.PAGE_2),
          backgroundColor: Theme.of(context).primaryColor),
    ];
  }
}
