import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
////https://viblo.asia/p/tim-hieu-ve-providers-trong-flutter-4dbZNXrn5YM
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>( //      <--- ChangeNotifierProvider
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>( //                  <--- Consumer
                    builder: (context, myModel, child) {
                      return TextButton(
                        child: const Text('Do something'),
                        onPressed: (){
                          myModel.doSomething();
                        },
                      );
                    },
                  )
              ),

              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
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

class MyModel with ChangeNotifier { //                          <--- MyModel
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    if (kDebugMode) {
      print(someValue);
    }
    notifyListeners();
  }
}
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context, listen: false);
    return TextButton(
      child: const Text('Do something'),
      onPressed: () {
        myModel.doSomething();
      },
    );
  }
}