import 'dart:convert';

import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';

class HomeJobDto extends HomeJobEntity {
  String id;
  String title;
  // String company;
  String city;
  String modality;
  String photoUrl;
  HomeJobDto({
    required this.id,
    required this.title,
    // required this.company,
    required this.city,
    required this.modality,
    required this.photoUrl,
  }) : super(
          id: id,
          oportunity: title,
          // company: company,
          city: city,
          type: modality,
          imageUrl: photoUrl,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      // 'company': company,
      'city': city,
      'modality': modality,
      'imageUrl': imageUrl,
    };
  }

  factory HomeJobDto.fromMap(Map<String, dynamic> map) {
    return HomeJobDto(
      id: map['id'] as String,
      title: map['title'] as String,
      // company: map['company'] as String,
      city: map['city'] as String,
      modality: map['modality'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeJobDto.fromJson(String source) =>
      HomeJobDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
