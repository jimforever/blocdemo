import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCounterEvent>(this._incrementCounter);
    on<DecrementCounterEvent>(this._decrementCounter);
  }

  Future<void> _incrementCounter(
      IncrementCounterEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> _decrementCounter(
      DecrementCounterEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
