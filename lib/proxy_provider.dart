import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//https://viblo.asia/p/tim-hieu-ve-providers-trong-flutter-4dbZNXrn5YM
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( //                              <--- MultiProvider
      providers: [
        ChangeNotifierProvider<MyModel>( //               <--- ChangeNotifierProvider
          create: (context) => MyModel(),
        ),
        ProxyProvider<MyModel, AnotherModel>( //          <--- ProxyProvider
          update: (context, myModel, anotherModel) => AnotherModel(myModel),
        ),
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
                      child: Consumer<MyModel>( //          <--- MyModel Consumer
                        builder: (context, myModel, child) {
                          return TextButton(
                            child: const Text('Do something'),
                            onPressed: (){
                              myModel.doSomething('Goodbye');
                            },
                          );
                        },
                      )
                  ),

                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<MyModel>( //            <--- MyModel Consumer
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),

                ],
              ),

              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red[200],
                  child: Consumer<AnotherModel>( //          <--- AnotherModel Consumer
                    builder: (context, anotherModel, child) {
                      return TextButton(
                        child: const Text('Do something else'),
                        onPressed: (){
                          anotherModel.doSomethingElse();
                        },
                      );
                    },
                  )
              ),

            ],
          ),
        ),
      ),
    );

  }
}

class MyModel with ChangeNotifier { //                       <--- MyModel
  String someValue = 'Hello';
  void doSomething(String value) {
    someValue = value;
    if (kDebugMode) {
      print(someValue);
    }
    notifyListeners();
  }
}

class AnotherModel { //                                      <--- AnotherModel
  final MyModel _myModel;
  AnotherModel(this._myModel);
  void doSomethingElse() {
    _myModel.doSomething('See you later');
    if (kDebugMode) {
      print('doing something else');
    }
  }
}
