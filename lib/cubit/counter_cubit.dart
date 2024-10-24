import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CounterCubit extends Cubit<int> {
  // Hive box to store counter
  final Box<int> _counterBox = Hive.box<int>('counterBox');
  CounterCubit() : super(0) {
    // Retrieve the stored value from Hive (default to 0 if no value exist)
    emit(_counterBox.get('counter', defaultValue: 0)!);
  }

  // increment
  void increment() {
    final newValue = state + 1;
    _counterBox.put('counter', newValue);
    emit(newValue);
  }

  // decrement
  void decrement() {
    if (state > 0) {
      final newValue = state - 1;
      _counterBox.put('counter', newValue);
      emit(newValue);
    }
  }
}
