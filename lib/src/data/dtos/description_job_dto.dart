import 'dart:convert';

import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';

class DescriptionJobDto extends DescriptionJobEntity {
  String id;
  String nameCompany;
  String status;
  String title;
  String description;
  String photoUrl;
  String descriptionCompany;
  double salary;
  String modality;
  String city;
  String state;
  String link;
  String whatsapp;
  String email;
  String createdBy;

  DescriptionJobDto(
      {required this.id,
      required this.nameCompany,
      required this.status,
      required this.title,
      required this.description,
      required this.photoUrl,
      required this.descriptionCompany,
      required this.salary,
      required this.modality,
      required this.city,
      required this.state,
      required this.link,
      required this.whatsapp,
      required this.email,
      required this.createdBy})
      : super(
            id: id,
            nameCompany: nameCompany,
            status: status,
            title: title,
            description: description,
            photoUrl: photoUrl,
            descriptionCompany: descriptionCompany,
            salary: salary,
            modality: modality,
            city: city,
            state: state,
            link: link,
            whatsapp: whatsapp,
            email: email,
            createdBy: createdBy);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameCompany': nameCompany,
      'status': status,
      'title': title,
      'description': description,
      'photoUrl': photoUrl,
      'descriptionCompany': descriptionCompany,
      'salary': salary,
      'modality': modality,
      'city': city,
      'state': state,
      'link': link,
      'whatsapp': whatsapp,
      'email': email,
      'createdBy': createdBy
    };
  }

  factory DescriptionJobDto.fromMap(Map<String, dynamic> map) {
    return DescriptionJobDto(
      id: map['id'] as String,
      nameCompany: map['nameCompany'] as String,
      status: map['status'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      photoUrl: map['photoUrl'] as String,
      descriptionCompany: map['descriptionCompany'] as String,
      salary: map['salary'] as double,
      modality: map['modality'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      link: map['link'] as String,
      whatsapp: map['whatsapp'] as String,
      email: map['email'] as String,
      createdBy: map['createdBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DescriptionJobDto.fromJson(String source) =>
      DescriptionJobDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
