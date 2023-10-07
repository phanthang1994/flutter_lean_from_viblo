import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//https://codewithandrea.com/articles/flutter-state-management-riverpod/
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
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
    return const MaterialApp(
      title: 'Counter App',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          if (kDebugMode) {
            print('Rebuild Text widget');
          }
          final counter = ref.watch(counterProvider);
          return Text(
            'Count: $counter',
            style: const TextStyle(fontSize: 24.0),
          );
        }),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
              if (kDebugMode) {
                print('Rebuild button');
              }
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
