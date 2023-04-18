import 'package:vagas_flutter_mobile/src/domain/entities/states_entity.dart';

abstract class GetCityOptionsUseCase {
  Future<List<StateEntity>> call({required String filter});
}
