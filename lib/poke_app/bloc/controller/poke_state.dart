import 'package:state_management/poke_app/data/dto/poke_item_response_dto.dart';

abstract class PokeState {}

class ErrorState extends PokeState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class InitState extends PokeState {}

class LoadingState extends PokeState {}

class LoadedState extends PokeState {
  final List<PokeItemResponseDto> pokeList;

  LoadedState(this.pokeList);
}