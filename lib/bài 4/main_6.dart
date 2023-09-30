import 'package:flutter/material.dart';
// chatGPT
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _isChildEnabled = false;

  void _handleCallback(bool value) {
    setState(() {
      _isChildEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifting State Up and Callbacks Example'),
      ),
      body: Column(
        children: [
          ChildWidget(callback: _handleCallback),
          Text('Child is ${_isChildEnabled ? 'enabled' : 'disabled'}.'),
        ],
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final Function(bool) callback;

  const ChildWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        onPressed: () {
          callback(true);  // Callback to enable child
        },
        child: const Text('Enable Child'),
      ),
    );
  }
}
