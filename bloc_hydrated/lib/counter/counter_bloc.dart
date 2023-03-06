import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
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

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    print('counter from storage: $json');
    final counterState = CounterState.fromJson(json);
    print('CounterState: $counterState');
    return counterState;
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    print('CounterState to storage: $state');
    final counterJson = state.toJson();
    print('CounterJson : $counterJson');
    return counterJson;
  }
}
