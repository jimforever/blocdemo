import 'package:bloc_named/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            '${context.watch<CounterCubit>().state.counter}',
            style: TextStyle(fontSize: 52),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: Text(
                'Increment Counter',
                style: TextStyle(fontSize: 20),
              )),
        ],
      )),
    );
  }
}
