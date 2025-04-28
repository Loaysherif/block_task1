import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit class to manage the state of the counter
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); // Initial state is 0

  // Method to increment the counter
  void increment() => emit(state + 1);

  // Method to decrement the counter
  void decrement() => emit(state - 1);
}
