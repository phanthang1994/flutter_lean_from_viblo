import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//https://viblo.asia/p/tim-hieu-ve-providers-trong-flutter-4dbZNXrn5YM
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<MyModel>(//                              <--- Provider
      create: (context) => MyModel(),
      child: Consumer<MyModel>( //                           <--- MyModel Consumer
          builder: (context, myModel, child) {
            return ValueListenableProvider<String>.value( // <--- ValueListenableProvider
              value: myModel.someValue,
              child: MaterialApp(
                home: Scaffold(
                  appBar: AppBar(title: const Text('My App')),
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.green[200],
                          child: Consumer<MyModel>( //       <--- Consumer
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
                        child: Consumer<String>(//           <--- String Consumer
                          builder: (context, myValue, child) {
                            return Text(myValue);
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class MyModel { //                                             <--- MyModel
  ValueNotifier<String> someValue = ValueNotifier('Hello'); // <--- ValueNotifier
  void doSomething() {
    someValue.value = 'Goodbye';
    if (kDebugMode) {
      print(someValue.value);
    }
  }
}
