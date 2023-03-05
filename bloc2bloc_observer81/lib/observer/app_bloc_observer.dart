import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print('onCreate - ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {}

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError - ${bloc.runtimeType}: $error, $stackTrace');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition - ${bloc.runtimeType}: $transition');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('onChange - ${bloc.runtimeType}: $change');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('onEvent - ${bloc.runtimeType}: $event');
  }
}
