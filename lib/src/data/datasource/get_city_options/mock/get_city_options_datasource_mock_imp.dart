import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_city_options/get_city_options_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/state_dto.dart';

class GetCityOptionsDataSourceMockImp implements GetCityOptionsDataSource {
  Dio dio = Dio();
  @override
  Future<List<CityDto>> call({String? cityFilter}) async {
    List<CityDto> listCity = [];

    try {
      String pathCitys = "assets/json/estados-cidades2.json";
      final response = await rootBundle.loadString(pathCitys);

      List<dynamic> jsonData = json.decode(response)["cities"] as List;

      listCity = jsonData.map((json) => CityDto.fromMap(json)).toList();

      return listCity;
    } catch (e) {
      return [];
    }
  }
}
