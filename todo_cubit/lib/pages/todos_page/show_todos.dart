import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/cubits.dart';

import '../../cubits/filtered_todos/filtered_todos_cubit.dart';
import '../../models/todo_model.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodosCubit>().state.filteredTodos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListCubit, TodoListState>(listener: (context, state) {
          context.read<FilteredTodosCubit>().setFilteredTodos(
              context.read<TodoFilterCubit>().state.filter,
              state.todos,
              context.read<TodoSearchCubit>().state.searchTerm);
        }),
        BlocListener<TodoFilterCubit, TodoFilterState>(
            listener: (context, state) {
          context.read<FilteredTodosCubit>().setFilteredTodos(
              state.filter,
              context.read<TodoListCubit>().state.todos,
              context.read<TodoSearchCubit>().state.searchTerm);
        }),
        BlocListener<TodoSearchCubit, TodoSearchState>(
            listener: (context, state) {
          context.read<FilteredTodosCubit>().setFilteredTodos(
              context.read<TodoFilterCubit>().state.filter,
              context.read<TodoListCubit>().state.todos,
              state.searchTerm);
        }),
      ],
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: ValueKey(todos[index].id),
              background: showBackground(0),
              secondaryBackground: showBackground(1),
              onDismissed: (_) {
                context.read<TodoListCubit>().removeTodo(todos[index]);
              },
              child: TodoItem(
                todo: todos[index],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: Colors.grey);
          },
          itemCount: todos.length),
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? checked) {
          context.read<TodoListCubit>().toggleTodo(widget.todo.id);
        },
      ),
      title: Text(widget.todo.desc),
    );
  }
}
