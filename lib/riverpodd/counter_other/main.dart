import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../counter_notifier.dart';
import '../counter_state.dart';
//https://github.com/ThrowJojo/riverpod_counter_example
//https://developermemos.com/posts/counter-riverpod-v1
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends HookConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CounterState counterState = ref.watch(counterProvider);
    final CounterNotifier counterNotifier = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Count: ${counterState.value}'),
            ),
            ElevatedButton(
              onPressed: () => counterNotifier.increase(),
              child: const Text('Increase'),
            ),
            ElevatedButton(
              onPressed: () => counterNotifier.decrease(),
              child: const Text('Decrease'),
            )
          ],
        ),
      ),
    );
  }
}
