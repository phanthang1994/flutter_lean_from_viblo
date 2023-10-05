import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

// Riverpod state notifier for the counter
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

// Provider for the CounterNotifier
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
        ),
        body: const CounterWidget(),
        floatingActionButton: const FloatingButtons(),
      ),
    );
  }
}

class CounterWidget extends ConsumerWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Center(
      child: Text(
        'Counter Value: $counter',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 16.0),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        );
      },
    );
  }
}

