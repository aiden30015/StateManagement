import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:state_management/poke_app/data/dto/poke_item_response_dto.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    final envBaseUrl = dotenv.env['BASE_URL']!;
    return _ApiService(dio, baseUrl: baseUrl ?? envBaseUrl);
  }
  @GET("/pokemon")
  Future<PokeItemResponseDto> getItems(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );
}
