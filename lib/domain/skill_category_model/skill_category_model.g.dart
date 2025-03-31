// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillCategoryMasterModelImpl _$$SkillCategoryMasterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SkillCategoryMasterModelImpl(
      skillCategories: (json['skillCategories'] as List<dynamic>)
          .map((e) => SkillCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SkillCategoryMasterModelImplToJson(
        _$SkillCategoryMasterModelImpl instance) =>
    <String, dynamic>{
      'skillCategories': instance.skillCategories,
    };

_$SkillCategoryModelImpl _$$SkillCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SkillCategoryModelImpl(
      name: json['name'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SkillCategoryModelImplToJson(
        _$SkillCategoryModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'skills': instance.skills,
    };
