import 'package:counter_using_bloc_task1/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter App Using cubit"),
        ),
        body: Center(
          child: BlocConsumer<CounterCubit, CounterState>(
            listener: (context,state){
              if(state is CounterSuccess && state.counter<0){
                showDialog(context: context,
                    builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Waring",),
                    content: Text("Counter is negative!"),
                    actions: [
                      TextButton(onPressed:()
                      { Navigator.of(context).pop();
                        },
                          child: Text('OK'))
                    ],
                  );
                });
              }
              if(state is CounterSuccess && state.counter==10){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text ("Counter Reached 10!")),
                );
              }
            },
            builder: (context, state) {
              if (state is CounterInitial) {
                print('Intial state');
              }
              if (state is CounterSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${state.counter}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium,
                    ),
                  ],
                );
              }
              if (state is CounterError) {
                Center(child: Text(state.error),);
              }
              return Container();
            },
          ),
        ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                      onPressed: context.read<CounterCubit>().decrementCounter,
                      tooltip: 'Decrement',
                      child: const Icon(Icons.minimize),
                    ),

              FloatingActionButton(
                onPressed: context.read<CounterCubit>().incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        )
    );
  }
}