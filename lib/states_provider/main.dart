import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/states_provider/settings.dart';

import 'about.dart';
import 'home.dart';
import 'model/ui.dart';
//https://github.com/mahmudahsan/flutter/tree/master
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UI()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => About(),
          '/settings': (context) => const Settings(),
        },
      ),
    );
  }
}
