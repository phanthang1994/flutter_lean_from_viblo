import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/viblo_2/provider/recipe_provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => RecipeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider App Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          hintColor: Colors.blueGrey[300],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    ),
    );
  }
}
