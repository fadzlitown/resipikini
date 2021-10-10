import 'package:flutter/material.dart';
import 'package:resipikini/tabs_screen.dart';

import 'const.dart' as globals;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: TabsScreen(title: globals.Const.APP_NAME),
    );
  }
}
