import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:state_management/poke_app/data/dto/poke_item_response_dto.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, ) {
    final envBaseUrl = dotenv.env['BASE_URL']!;
    return _ApiService(dio, baseUrl: envBaseUrl);
  }
  @GET("/pokemon")
  Future<List<PokeItemResponseDto>> fetchPoketmons(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );
}
