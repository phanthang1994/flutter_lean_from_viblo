import 'package:flutter/material.dart';
//https://viblo.asia/p/hoc-flutter-tu-co-ban-den-nang-cao-phan-4-lot-tran-inheritedwidget-3P0lPDbmlox
// Way 1 Passing state down counter: 1 and lifting data  _counter++;
void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(isLoading: false, counter: 1),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  final bool isLoading;
  final int counter;

  const MyHomePage({super.key,
    required this.isLoading,
    required this.counter,
  });

  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  late bool _isLoading;
  late int _counter;
  @override
  void initState() {
    super.initState();
    _isLoading = widget.isLoading;
    _counter = widget.counter;
  }
  @override
  Widget build(BuildContext context) {
    print('rebuild MyHomePage');
    return Scaffold(
      body: Center(
        child: DisplayCounterWidget(
          isLoading: _isLoading,
          counter:_counter,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingButtonClicked,
      ),
    );
  }

  void onFloatingButtonClicked() {
    print('Button clicked!. Call setState method');
    setState(() {
      _counter++;
    });
  }
}

class DisplayCounterWidget extends StatelessWidget {
  final bool isLoading;
  final int counter;

  const DisplayCounterWidget({super.key,
    required this.isLoading,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? const CircularProgressIndicator() : Text('$counter');
  }
}
