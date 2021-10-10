import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'const.dart' as globals;

/// This Tabs Screen required a state to saved in app
/// eg. init pages, list meals. Hence, StatefulWidget is needed
class TabsScreen extends StatefulWidget {
  String title;

  @override
  _TabsScreenState createState() => _TabsScreenState();

  TabsScreen({this.title});
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
      {'page': Container(), 'title': globals.Const.PAGE_2}
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
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text(globals.Const.PAGE_1),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text(globals.Const.PAGE_2),
              backgroundColor: Theme.of(context).primaryColor)
        ],
      ),
    );
  }
}
