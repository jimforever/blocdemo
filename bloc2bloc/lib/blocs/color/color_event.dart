part of 'color_bloc.dart';

@immutable
abstract class ColorEvent extends Equatable {
  const ColorEvent();
  @override
  List<Object> get props => [];
}

class ChangeColorEvent extends ColorEvent {}
