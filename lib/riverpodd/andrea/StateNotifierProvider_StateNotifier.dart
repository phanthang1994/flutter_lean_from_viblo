import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
//https://codewithandrea.com/articles/flutter-state-management-riverpod/
// provider that returns a string value

void main() {
  // wrap the entire app with a ProviderScope so that widgets
  // will be able to read providers
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}
// Note: StateNotifierProvider has *two* type annotations
final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});
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
      home: const ClockWidget(),
    );
  }
}


final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class Clock extends StateNotifier<DateTime> {
  // 1. initialize with current time
  Clock() : super(DateTime.now()) {
    // 2. create a timer that fires every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      // 3. update the state with the current time
      state = DateTime.now();
    });
  }

  late final Timer _timer;

  // 4. cancel the timer when finished
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class ClockWidget extends ConsumerWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch the StateNotifierProvider to return a DateTime (the state)
    final currentTime = ref.watch(clockProvider);
    // format the time as `hh:mm:ss`
    final timeFormatted = DateFormat.Hms().format(currentTime);
    return Text(timeFormatted);
  }
}