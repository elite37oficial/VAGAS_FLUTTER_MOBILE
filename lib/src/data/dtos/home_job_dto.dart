import 'dart:convert';

import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';

class HomeJobDto extends HomeJobEntity {
  int id;
  String oportunity;
  String company;
  String city;
  String type;
  String imageUrl;
  HomeJobDto({
    required this.id,
    required this.oportunity,
    required this.company,
    required this.city,
    required this.type,
    required this.imageUrl,
  }) : super(
          id: id,
          oportunity: oportunity,
          company: company,
          city: city,
          type: type,
          imageUrl: imageUrl,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'oportunity': oportunity,
      'company': company,
      'city': city,
      'type': type,
      'imageUrl': imageUrl,
    };
  }

  factory HomeJobDto.fromMap(Map<String, dynamic> map) {
    return HomeJobDto(
      id: map['id'] as int,
      oportunity: map['oportunity'] as String,
      company: map['company'] as String,
      city: map['city'] as String,
      type: map['type'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeJobDto.fromJson(String source) =>
      HomeJobDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
