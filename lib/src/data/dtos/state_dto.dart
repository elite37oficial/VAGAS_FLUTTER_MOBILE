import 'dart:convert';

import '../../domain/entities/city_entity.dart';

class CityDto extends CityEntity {
  int state_id;
  int id;
  String name;
  CityDto({
    required this.state_id,
    required this.id,
    required this.name,
  }) : super(stateId: state_id, cityId: id, cityName: name);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'state_id': state_id,
      'id': id,
      'name': name,
    };
  }

  factory CityDto.fromMap(Map<String, dynamic> map) {
    return CityDto(
      state_id: map['state_id'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityDto.fromJson(String source) =>
      CityDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
