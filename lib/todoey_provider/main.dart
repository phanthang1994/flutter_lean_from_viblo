import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/todoey_provider/screens/task_screen.dart';

import 'models/task_data.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}