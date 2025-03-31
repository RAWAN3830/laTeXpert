// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperienceMasterModelImpl _$$ExperienceMasterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExperienceMasterModelImpl(
      experiences: (json['experiences'] as List<dynamic>)
          .map((e) => ExperienceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExperienceMasterModelImplToJson(
        _$ExperienceMasterModelImpl instance) =>
    <String, dynamic>{
      'experiences': instance.experiences,
    };

_$ExperienceModelImpl _$$ExperienceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExperienceModelImpl(
      employer: json['employer'] as String,
      jobTitle: json['jobTitle'] as String,
      location: json['location'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ExperienceModelImplToJson(
        _$ExperienceModelImpl instance) =>
    <String, dynamic>{
      'employer': instance.employer,
      'jobTitle': instance.jobTitle,
      'location': instance.location,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'description': instance.description,
    };
