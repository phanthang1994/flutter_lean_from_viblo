import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
//https://codewithandrea.com/articles/flutter-state-management-riverpod/
final counterFutureProvider = FutureProvider<int>((ref) async {
  // Load the counter from shared preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int counter = prefs.getInt('counter') ?? 0;

  // Return a Future<int> by using Future.value
  return Future.value(counter);
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
          title: const Text('Shared Preferences Example'),
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
    final counterAsync = ref.watch(counterFutureProvider);

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
              ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  // Increment the counter and save to shared preferences
                  await prefs.setInt('counter', counter + 1);
                  ref.refresh(counterFutureProvider); // Refresh the provider
                },
                child: const Text('Increment Counter'),
              ),
            ],
          ),
        );
      },
    );
  }
}
