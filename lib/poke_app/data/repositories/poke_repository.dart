import 'package:state_management/poke_app/data/api/api_service.dart';
import 'package:state_management/poke_app/data/dto/poke_item_response_dto.dart';

class PokeRepository {

  final ApiService apiService;
  PokeRepository(this.apiService);

  Future<List<PokeItemResponseDto>> fetchPokemons(int offset, int limit) async {
    return await apiService.fetchPoketmons(offset, limit);
  }
}