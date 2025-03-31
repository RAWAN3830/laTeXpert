// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationMasterModelImpl _$$EducationMasterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EducationMasterModelImpl(
      education_info: (json['education_info'] as List<dynamic>)
          .map((e) => EducationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EducationMasterModelImplToJson(
        _$EducationMasterModelImpl instance) =>
    <String, dynamic>{
      'education_info': instance.education_info,
    };

_$EducationModelImpl _$$EducationModelImplFromJson(Map<String, dynamic> json) =>
    _$EducationModelImpl(
      institution: json['institution'] as String,
      location: json['location'] as String,
      degreeType: json['degreeType'] as String,
      fieldOfStudy: json['fieldOfStudy'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$$EducationModelImplToJson(
        _$EducationModelImpl instance) =>
    <String, dynamic>{
      'institution': instance.institution,
      'location': instance.location,
      'degreeType': instance.degreeType,
      'fieldOfStudy': instance.fieldOfStudy,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
