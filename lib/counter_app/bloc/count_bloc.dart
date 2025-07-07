import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/counter_app/bloc/count_event.dart';

class CountBloc extends Bloc<CountEvent,int> {
    CountBloc() : super(0) {
      on<PlusEvent> ((event, emit) => emit(state + 1));
      on<MinusEvent> ((event, emit) => emit(state - 1));
    }
}