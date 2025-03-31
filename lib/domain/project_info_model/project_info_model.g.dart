// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectMasterModelImpl _$$ProjectMasterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectMasterModelImpl(
      projectMasterModel: (json['projectMasterModel'] as List<dynamic>)
          .map((e) => ProjectInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProjectMasterModelImplToJson(
        _$ProjectMasterModelImpl instance) =>
    <String, dynamic>{
      'projectMasterModel': instance.projectMasterModel,
    };

_$ProjectInfoModelImpl _$$ProjectInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectInfoModelImpl(
      projectTitle: json['projectTitle'] as String,
      technologiesUsed: json['technologiesUsed'] as String,
      projectLink: json['projectLink'] as String,
      projectDescription: json['projectDescription'] as String,
    );

Map<String, dynamic> _$$ProjectInfoModelImplToJson(
        _$ProjectInfoModelImpl instance) =>
    <String, dynamic>{
      'projectTitle': instance.projectTitle,
      'technologiesUsed': instance.technologiesUsed,
      'projectLink': instance.projectLink,
      'projectDescription': instance.projectDescription,
    };
