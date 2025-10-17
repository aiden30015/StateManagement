abstract class PokeEvent {}

class FetchPokeEvent extends PokeEvent {
  final int offset;
  final int limit;

  FetchPokeEvent({required this.offset, required this.limit});
}

