import 'package:bloc_hydrated/counter/counter_bloc.dart';
import 'package:bloc_hydrated/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'hydrated Bloc',
            debugShowCheckedModeBanner: false,
            theme: state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
          '${context.watch<CounterBloc>().state.counter}',
          style: const TextStyle(fontSize: 64),
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
              child: Icon(Icons.brightness_6),
            ),
            SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounterEvent());
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounterEvent());
              },
              child: Icon(Icons.remove),
            ),
            SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              onPressed: () {
                HydratedBloc.storage.clear();
              },
              child: Icon(Icons.delete_forever),
            ),
          ],
        ));
  }
}
