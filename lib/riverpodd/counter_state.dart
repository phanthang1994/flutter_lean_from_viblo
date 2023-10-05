class CounterState {
  CounterState({
    this.value = 0,
  });
  final int value;

  /// This is just a simple utility method, for more complex classes you might want to try out 'freezed'
  CounterState copyWith({int? count}) {
    return CounterState(
      value: count ?? value,
    );
  }
}
