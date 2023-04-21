// ignore_for_file: overridden_fields, annotate_overrides
import 'dart:convert';
import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';

class HomeJobDto extends HomeJobEntity {
  String id;
  String companyId;
  String title;
  String companyName;
  String city;
  String modality;
  HomeJobDto({
    required this.id,
    required this.companyId,
    required this.title,
    required this.companyName,
    required this.city,
    required this.modality,
  }) : super(
          id: id,
          companyId: companyId,
          title: title,
          companyName: companyName,
          city: city,
          modality: modality,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'companyId': companyId,
      'title': title,
      'companyName': companyName,
      'city': city,
      'modality': modality,
    };
  }

  factory HomeJobDto.fromMap(Map<String, dynamic> map) {
    return HomeJobDto(
      id: map['id'] as String,
      companyId: map['companyId'] as String,
      title: map['title'] as String,
      companyName: map['companyName'] as String,
      city: map['city'] as String,
      modality: map['modality'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeJobDto.fromJson(String source) =>
      HomeJobDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
