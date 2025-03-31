// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_resume_model_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinalResumeModelClassImpl _$$FinalResumeModelClassImplFromJson(
        Map<String, dynamic> json) =>
    _$FinalResumeModelClassImpl(
      achievements: AchievementMasterModel.fromJson(
          json['achievements'] as Map<String, dynamic>),
      declarations: DeclarationMasterModel.fromJson(
          json['declarations'] as Map<String, dynamic>),
      education: EducationMasterModel.fromJson(
          json['education'] as Map<String, dynamic>),
      experience: ExperienceMasterModel.fromJson(
          json['experience'] as Map<String, dynamic>),
      personalInfo: PersonalInfoModel.fromJson(
          json['personalInfo'] as Map<String, dynamic>),
      projects:
          ProjectMasterModel.fromJson(json['projects'] as Map<String, dynamic>),
      skills: SkillCategoryMasterModel.fromJson(
          json['skills'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FinalResumeModelClassImplToJson(
        _$FinalResumeModelClassImpl instance) =>
    <String, dynamic>{
      'achievements': instance.achievements,
      'declarations': instance.declarations,
      'education': instance.education,
      'experience': instance.experience,
      'personalInfo': instance.personalInfo,
      'projects': instance.projects,
      'skills': instance.skills,
    };
