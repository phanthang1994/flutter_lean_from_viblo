import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(onPressed: () {
          Scaffold.of(context).showBottomSheet(
                (context) => Text('Flutter From Zero to Hero'),
          );
        });
      }),
    );
  }
}
