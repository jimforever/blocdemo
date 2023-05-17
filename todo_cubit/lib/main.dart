import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/cubits.dart';
import 'package:todo_cubit/pages/todos_page/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
            create: (BuildContext context) => TodoFilterCubit()),
        BlocProvider<TodoSearchCubit>(
            create: (BuildContext context) => TodoSearchCubit()),
        BlocProvider<TodoListCubit>(
            create: (BuildContext context) => TodoListCubit()),
        BlocProvider<ActiveTodoCountCubit>(
            create: (BuildContext context) => ActiveTodoCountCubit(
                initialActiveTodoCount:
                    context.read<TodoListCubit>().state.todos.length,
                todoListCubit: context.read<TodoListCubit>())),
        BlocProvider<FilteredTodosCubit>(
            create: (BuildContext context) => FilteredTodosCubit(
                initialTodos: context.read<TodoListCubit>().state.todos,
                todoListCubit: context.read<TodoListCubit>(),
                todoFilterCubit: context.read<TodoFilterCubit>(),
                todoSearchCubit: context.read<TodoSearchCubit>())),
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodosPage(),
      ),
    );
  }
}
