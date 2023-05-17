import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends Cubit<TodoSearchState> {
  TodoSearchCubit() : super(TodoSearchState.initial());
  void setSearchTerm(String newSearchTerm) {
    print("setSearchTerm is called $newSearchTerm");
    emit(state.copyWith(searchTerm: newSearchTerm));
  }
}
