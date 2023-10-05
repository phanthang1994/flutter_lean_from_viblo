import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Provider that returns a string value
final helloWorldProvider = Provider<String>((ref) {
  return 'Hello world';
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

class HelloWorldWidget extends StatelessWidget {
  const HelloWorldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // 1. Add a Consumer
      body: Consumer(
        // 2. specify the builder and obtain a WidgetRef
        builder: (_, WidgetRef ref, __) {
          // 3. use ref.watch() to get the value of the provider
          final helloWorld = ref.watch(helloWorldProvider);
          return Text(helloWorld);
        },
      ),
    );
  }
}
