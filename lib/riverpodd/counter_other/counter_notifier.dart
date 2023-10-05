import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../counter_state.dart';

final counterProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, CounterState>(
  (_) => CounterNotifier(),
);

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(CounterState());

  void increase() => state = state.copyWith(count: state.value + 1);
  void decrease() => state = state.copyWith(count: state.value - 1);
}
