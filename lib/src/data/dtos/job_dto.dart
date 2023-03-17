import 'dart:convert';
import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';

class JobDto extends JobEntity {
  String oportunity;
  String company;
  String city;
  String type;
  double value;
  String imageUrl;
  String modality;
  String seniority;
  String description;
  String aboutCompany;
  JobDto({
    required this.oportunity,
    required this.company,
    required this.city,
    required this.type,
    required this.value,
    required this.imageUrl,
    required this.modality,
    required this.seniority,
    required this.description,
    required this.aboutCompany,
  }) : super(
          oportunity: oportunity,
          company: company,
          city: city,
          type: type,
          value: value,
          imageUrl: imageUrl,
          modality: modality,
          seniority: seniority,
          description: description,
          aboutCompany: aboutCompany,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oportunity': oportunity,
      'company': company,
      'city': city,
      'type': type,
      'value': value,
      'imageUrl': imageUrl,
      'modality': modality,
      'seniority': seniority,
      'description': description,
      'aboutCompany': aboutCompany,
    };
  }

  factory JobDto.fromMap(Map<String, dynamic> map) {
    return JobDto(
      oportunity: map['oportunity'] as String,
      company: map['company'] as String,
      city: map['city'] as String,
      type: map['type'] as String,
      value: map['value'] as double,
      imageUrl: map['imageUrl'] as String,
      modality: map['modality'] as String,
      seniority: map['seniority'] as String,
      description: map['description'] as String,
      aboutCompany: map['aboutCompany'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobDto.fromJson(String source) => JobDto.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
