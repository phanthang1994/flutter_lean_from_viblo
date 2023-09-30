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
      backgroundColor: Color(0xFF1B5E20),
      body: Scaffold(
        backgroundColor: Color(0xffe91e63),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(onPressed: () {
            print(Scaffold.of(context).widget.backgroundColor);
          });
        }),
      ),
    );
  }
}
