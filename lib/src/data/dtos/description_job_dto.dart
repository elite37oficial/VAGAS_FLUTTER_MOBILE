import 'dart:convert';

import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';

class DescriptionJobDto extends DescriptionJobEntity {
  String id;
  String oportunity;
  String company;
  String city;
  String type;
  String imageUrl;
  double value;
  String modality;
  String seniority;
  String description;
  String aboutCompany;
  DescriptionJobDto({
    required this.id,
    required this.oportunity,
    required this.company,
    required this.city,
    required this.type,
    required this.imageUrl,
    required this.value,
    required this.modality,
    required this.seniority,
    required this.description,
    required this.aboutCompany,
  }) : super(
          id: id,
          oportunity: oportunity,
          company: company,
          city: city,
          type: type,
          imageUrl: imageUrl,
          value: value,
          modality: modality,
          seniority: seniority,
          description: description,
          aboutCompany: aboutCompany,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'oportunity': oportunity,
      'company': company,
      'city': city,
      'type': type,
      'imageUrl': imageUrl,
      'value': value,
      'modality': modality,
      'seniority': seniority,
      'description': description,
      'aboutCompany': aboutCompany,
    };
  }

  factory DescriptionJobDto.fromMap(Map<String, dynamic> map) {
    return DescriptionJobDto(
      id: map['id'] as String,
      oportunity: map['oportunity'] as String,
      company: map['company'] as String,
      city: map['city'] as String,
      type: map['type'] as String,
      imageUrl: map['imageUrl'] as String,
      value: map['value'] as double,
      modality: map['modality'] as String,
      seniority: map['seniority'] as String,
      description: map['description'] as String,
      aboutCompany: map['aboutCompany'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DescriptionJobDto.fromJson(String source) =>
      DescriptionJobDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
