import 'dart:convert';
import 'package:vagas_flutter_mobile/src/domain/entities/report_job_entity.dart';

class ReportJobDto extends ReportJobEntity {
  final String jobId;
  final String description;
  ReportJobDto({
    required this.jobId,
    required this.description,
  }) : super(jobId: jobId, description: description);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobId': jobId,
      'description': description,
    };
  }

  factory ReportJobDto.fromMap(Map<String, dynamic> map) {
    return ReportJobDto(
      jobId: map['jobId'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportJobDto.fromJson(String source) =>
      ReportJobDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
