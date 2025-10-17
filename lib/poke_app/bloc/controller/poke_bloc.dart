import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/poke_app/bloc/controller/poke_event.dart';
import 'package:state_management/poke_app/bloc/controller/poke_state.dart';
import 'package:state_management/poke_app/data/repositories/poke_repository.dart';

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  final PokeRepository pokeRepository;

  PokeBloc({required this.pokeRepository}) : super(InitState()) {
    on<FetchPokeEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final pokemons = await pokeRepository.fetchPokemons(event.offset,event.limit);
        emit(LoadedState(pokemons));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}