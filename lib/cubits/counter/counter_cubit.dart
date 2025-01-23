import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial()){
    incrementCounter();
  }

  int counter = 0;

  void incrementCounter() {
    try{
      emit(CounterSuccess(counter:counter++));
    }catch(e){
      emit(CounterError(e.toString()));
    }
  }

  void decrementCounter() {
    try{
      emit(CounterSuccess(counter:counter--));
    }catch(e){
      emit(CounterError(e.toString()));
    }
  }
}
