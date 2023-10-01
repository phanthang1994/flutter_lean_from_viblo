import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//https://viblo.asia/p/tim-hieu-ve-providers-trong-flutter-4dbZNXrn5YM
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(create: (context) => MyModel()),
        ChangeNotifierProvider<AnotherModel>(create: (context) => AnotherModel()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('My App')),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.green[200],
                    child: TextButton(
                      child: const Text('Do something'),
                      onPressed: () {
                        final myModel = context.read<MyModel>();
                        myModel.doSomething();
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<MyModel>(
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.red[200],
                    child: TextButton(
                      child: const Text('Do something'),
                      onPressed: () {
                        final anotherModel = context.read<AnotherModel>();
                        anotherModel.doSomething();
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.yellow[200],
                    child: Consumer<AnotherModel>(
                      builder: (context, anotherModel, child) {
                        return Text('${anotherModel.someValue}');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    if (kDebugMode) {
      print(someValue);
    }
    notifyListeners();
  }
}

class AnotherModel with ChangeNotifier {
  int someValue = 0;

  void doSomething() {
    someValue = 5;
    if (kDebugMode) {
      print(someValue);
    }
    notifyListeners();
  }
}
