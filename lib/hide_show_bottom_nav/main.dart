import 'package:flutter/material.dart';
import 'hide_on_scroll.dart';
import 'basic_bottom_nav_bar.dart';
import 'with_fab.dart';
import 'with_tabbar.dart';
//https://blog.logrocket.com/how-to-build-a-bottom-navigation-bar-in-flutter/
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: HideOnScroll(),
    );
  }
}
