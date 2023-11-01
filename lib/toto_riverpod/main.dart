import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/app/app.dart';
//https://github.com/IsaiasCuvula/flutter_riverpod_todo_app?fbclid=IwAR3-G9J-yg1yup5mxjE0-0nxnL45CuVvGBBFEPfPr_587FBstIRU5PMBYZ8
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: FlutterRiverpodTodoApp(),
    ),
  );
}
