import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_city_options/get_city_options_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/state_dto.dart';

class GetCityOptionsDataSourceMockImp implements GetCityOptionsDataSource {
  @override
  Future<List<CityDto>> call({String? cityFilter}) async {
    Dio dio = Dio();

    List<CityDto> listCity = [];

    try {
      String urlCitys =
          "https://gist.githubusercontent.com/letanure/3012978/raw/6938daa8ba69bcafa89a8c719690225641e39586/estados-cidades2.json";
      final response = await dio.get(urlCitys);

      List<dynamic> jsonData = json.decode(response.data)["cities"] as List;

      listCity = jsonData.map((json) => CityDto.fromMap(json)).toList();

      return listCity;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
