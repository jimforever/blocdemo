part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final int randInt;

  ChangeThemeEvent({required this.randInt});

  @override
  String toString() {
    return 'ChangeThemeEvent{randInt: $randInt}';
  }

  @override
  List<Object> get props => [randInt];
}
