import 'package:vagas_flutter_mobile/src/data/datasource/get_developers/get_developers_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_developers/mock/mock_developers.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/develop_dto.dart';

class GetDevelopersDataSourceMockImp implements GetDevelopersDataSource {
  @override
  Future<List<DevelopDto>> call() async {
    final List<DevelopDto> listDevelopers = mockDevelopList;
    return listDevelopers;
  }
}
