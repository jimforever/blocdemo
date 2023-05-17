import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/filtered_todos/filtered_todos_cubit.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodosCubit>().state.filteredTodos;
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            background: showBackground(0),
            secondaryBackground: showBackground(1),
            child: Text(
              todos[index].desc,
              style: TextStyle(fontSize: 20),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.grey);
        },
        itemCount: todos.length);
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
