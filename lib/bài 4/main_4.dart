import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//https://viblo.asia/p/hoc-flutter-tu-co-ban-den-nang-cao-phan-4-lot-tran-inheritedwidget-3P0lPDbmlox
// rebuild 1 phần
void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(
        isLoading: false,
        counter: 0,
        child: MyCenterWidget(),
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  final bool isLoading;
  final int counter;
  final Widget child;

  const MyHomePage({super.key,
    required this.isLoading,
    required this.counter,
    required this.child,
  });

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
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
    if (kDebugMode) {
      print('rebuild MyHomePage');
    }
    return Scaffold(
      body: MyInheritedWidget(
        isLoading: _isLoading,
        counter: _counter,
        child: widget.child,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingButtonClicked,
      ),
    );
  }

  void onFloatingButtonClicked() {
    if (kDebugMode) {
      print('Button clicked!. Call setState method');
    }
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _isLoading = false;
      } else {
        _isLoading = true;
      }
    });
  }
}

class DisplayCounterWidget extends StatelessWidget {
  const DisplayCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild DisplayCounterWidget');
    }
    final myInheritedWidget = MyInheritedWidget.of(context);

    if (myInheritedWidget == null) {
      return const Text('MyInheritedWidget was not found');
    }

    return myInheritedWidget.isLoading
        ? const CircularProgressIndicator()
        : Text('${myInheritedWidget.counter}');
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild MyCenterWidget');
    }
    return const Center(
      child: DisplayCounterWidget(),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final int counter;
  final bool isLoading;
  @override
  final Widget child;

  const MyInheritedWidget({super.key,
    required this.isLoading,
    required this.counter,
    required this.child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return isLoading != oldWidget.isLoading || counter != oldWidget.counter;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
