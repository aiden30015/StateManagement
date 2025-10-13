import 'package:json_annotation/json_annotation.dart';

part 'poke_item_response_dto.g.dart';

@JsonSerializable()
class PokeItemResponseDto {
  final int count;
  final String next;
  final String? previous;
  final List<Result> results;

  PokeItemResponseDto({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  factory PokeItemResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PokeItemResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokeItemResponseDtoToJson(this);
}

@JsonSerializable()
class Result {
  final String name;
  final String url;

  Result({required this.name, required this.url});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
