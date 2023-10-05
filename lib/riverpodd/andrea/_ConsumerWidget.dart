import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//https://codewithandrea.com/articles/flutter-state-management-riverpod/
// provider that returns a string value
final helloWorldProvider = Provider<String>((ref) {
  return 'Hello world';
});

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

class HelloWorldWidget extends ConsumerWidget {
  const HelloWorldWidget({super.key});

  @override
  // 2. build method has an extra [WidgetRef] argument
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. use ref.watch() to get the value of the provider
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }
}

