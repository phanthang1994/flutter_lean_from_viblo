import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final counterStreamProvider = StreamProvider<int>((ref) async* {
  final prefs = await SharedPreferences.getInstance();
  int counter = prefs.getInt('counter') ?? 0;

  // Increment the counter every second
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    counter++;
    prefs.setInt('counter', counter); // Save the counter to SharedPreferences
    yield counter;
  }
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
        ),
        body: const CounterInfo(),
      ),
    );
  }
}

class CounterInfo extends ConsumerWidget {
  const CounterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> counterAsync = ref.watch(counterStreamProvider);

    return counterAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Center(
        child: Text('Error: $err'),
      ),
      data: (counter) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Counter Value:',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 48.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
