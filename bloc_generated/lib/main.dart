import 'package:bloc_generated/counter/counter_cubit.dart';
import 'package:bloc_generated/show_me_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Route',
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
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: MyHomePage(),
            ),
        '/counter': (context) => BlocProvider.value(
              value: _counterCubit,
              child: ShowMeCounter(),
            )
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterCubit.close();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  print(
                      "counter is ${context.read<CounterCubit>().state.counter}");
                  Navigator.pushNamed(context, '/counter');
                },
                child: Text(
                  'Show Me Counter',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                child: Text(
                  'Increment Counter',
                  style: TextStyle(fontSize: 20),
                )),
            Text("counter is ${context.watch<CounterCubit>().state.counter}")
          ],
        ),
      ),
    );
  }
}
