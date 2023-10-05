import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//https://codewithandrea.com/articles/flutter-state-management-riverpod/
// provider that returns a string value

void main() {
  // wrap the entire app with a ProviderScope so that widgets
  // will be able to read providers
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HelloWorldWidget(),
    );
  }
}


final helloWorldProvider = Provider<String>((_) => 'Hello world');

// 1. extend [ConsumerStatefulWidget]
class HelloWorldWidget extends ConsumerStatefulWidget {
  const HelloWorldWidget({super.key});

  @override
  ConsumerState<HelloWorldWidget> createState() => _HelloWorldWidgetState();
}

// 2. extend [ConsumerState]
class _HelloWorldWidgetState extends ConsumerState<HelloWorldWidget> {
  @override
  void initState() {
    super.initState();
    // 3. if needed, we can read the provider inside initState
    final helloWorld = ref.read(helloWorldProvider);
    print(helloWorld); // "Hello world"
  }

  @override
  Widget build(BuildContext context) {
    // 4. use ref.watch() to get the value of the provider
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }
}