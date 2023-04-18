import 'package:vagas_flutter_mobile/src/domain/entities/states_entity.dart';

abstract class GetCityOptionsRepository {
  Future<List<StateEntity>> call({required String filter});
}
