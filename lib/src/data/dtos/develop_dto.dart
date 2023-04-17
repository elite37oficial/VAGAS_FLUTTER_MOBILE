import 'dart:convert';
import 'package:vagas_flutter_mobile/src/domain/entities/develop_emtity.dart';

class DevelopDto extends DevelopEntity {
  final String name;
  final String atuation;
  final String linkedinUrl;
  final String gitHubUrl;

  DevelopDto({
    required this.name,
    required this.atuation,
    required this.linkedinUrl,
    required this.gitHubUrl,
  }) : super(
          name: name,
          atuation: atuation,
          linkedinUrl: linkedinUrl,
          gitHubUrl: gitHubUrl,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'atuation': atuation,
      'linkedinUrl': linkedinUrl,
      'gitHubUrl': gitHubUrl,
    };
  }

  factory DevelopDto.fromMap(Map<String, dynamic> map) {
    return DevelopDto(
      name: map['name'] as String,
      atuation: map['atuation'] as String,
      linkedinUrl: map['linkedinUrl'] as String,
      gitHubUrl: map['gitHubUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DevelopDto.fromJson(String source) =>
      DevelopDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
