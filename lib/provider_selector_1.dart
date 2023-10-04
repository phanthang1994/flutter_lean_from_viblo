import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//https://medium.com/@ggcsriram/flutter-provider-with-selector-4b469e6539a5
//https://viblo.asia/p/flutter-provider-cung-voi-selector-vyDZOMjR5wj
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider( create: (BuildContext context) =>CounterProvider(),),],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home:const CountScreen()),);}}

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  CountScreenState createState() => CountScreenState();
}

class CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      builder: (BuildContext context, _) {
        final counterProvider = Provider.of<CounterProvider>(context, listen: false);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<CounterProvider>(
                  builder: (context, data, child) {
                    if (kDebugMode) {
                      print('Update UI Consumer 1');
                    }
                    return Container(
                      height: 40,
                      color: Colors.red,
                      child: Center(child: Text('Consumer1: ${data.getCount}')),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Consumer<CounterProvider>(
                  builder: (context, data, child) {
                    if (kDebugMode) {
                      print('Update UI Consumer 2');
                    }
                    return Container(
                      height: 40,
                      color: Colors.blue,
                      child: Center(child: Text('Consumer2: ${data.getCount1}')),
                    );
                  },
                )
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton.extended(
                backgroundColor: Colors.red,
                onPressed: () {
                  counterProvider.incrementCounter();
                },
                label: const Text('Consumer 1'),
                icon: const Icon(Icons.add),
              ),
              const Expanded(child: SizedBox()),
              FloatingActionButton.extended(
                backgroundColor: Colors.blue,
                onPressed: () {
                  counterProvider.incrementCounter1();
                },
                label: const Text('Consumer 2'),
                icon: const Icon(Icons.minimize),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CounterProvider extends ChangeNotifier{
  int count =0;
  int count1 =0;
  int get getCount1=>count1;
  int get getCount=>count;
  incrementCounter(){
    count++;
    notifyListeners();
  }
  incrementCounter1(){
    count1--;
    notifyListeners();
  }}