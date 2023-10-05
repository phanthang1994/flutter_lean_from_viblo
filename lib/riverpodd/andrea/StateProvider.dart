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
      home: const CounterWidget(),
    );
  }
}


final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. watch the provider and rebuild when the value changes
    final counter = ref.watch(counterStateProvider);
    return ElevatedButton(
      // 2. use the value
      child: Text('Value: $counter'),
      // 3. change the state inside a button callback
      onPressed: () => ref.read(counterStateProvider.notifier).state++,
    );
  }
}