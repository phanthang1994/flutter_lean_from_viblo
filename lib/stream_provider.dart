import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<String>(
      initialData: 'Hello',
      create: (context) => getStreamOfData(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<String>(
                  builder: (context, data, child) {
                    return TextButton(
                      child: const Text('Do something'),
                      onPressed: () {
                        context.read<StreamController<String>>().add('Goodbye');
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<String>(
                  builder: (context, data, child) {
                    return Text(data);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Stream<String> getStreamOfData() {
  final controller = StreamController<String>();

  // Add a default value
  controller.add('Hello');

  return controller.stream;
}
