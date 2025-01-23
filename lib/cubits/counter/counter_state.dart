part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

class CounterInitial extends CounterState {}


class CounterSuccess extends CounterState {
  int counter;
  CounterSuccess({required this.counter});
}

class CounterError extends CounterState {
  final String error;
  CounterError(this.error);
}
