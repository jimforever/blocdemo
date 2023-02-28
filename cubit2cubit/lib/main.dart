import 'package:cubit2cubit/cubits/color/color_cubit.dart';
import 'package:cubit2cubit/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
          BlocProvider<CounterCubit>(
              create: (context) =>
                  CounterCubit(colorCubit: context.read<ColorCubit>())),
        ],
        child: MaterialApp(
          title: 'cubit2cuibit',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<ColorCubit>().changeColor();
                },
                child: Text(
                  'Change Color',
                  style: TextStyle(fontSize: 24.0),
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              '${context.watch<CounterCubit>().state.counter}',
              style: TextStyle(
                  fontSize: 52.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterCubit>().changeCounter();
                },
                child: Text(
                  'Increment Counter',
                  style: TextStyle(fontSize: 24.0),
                )),
          ],
        ),
      ),
    );
  }
}
