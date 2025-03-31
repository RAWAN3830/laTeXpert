import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latexpert/domain/achievement_info_model/achievement_info_model.dart';
import 'package:latexpert/domain/declaration_model/declaration_model.dart';
import 'package:latexpert/domain/education_model/education_model.dart';
import 'package:latexpert/domain/experience_model/experience_model.dart';
import 'package:latexpert/domain/personal_info_model/personal_info_model.dart';
import 'package:latexpert/domain/project_info_model/project_info_model.dart';
import 'package:latexpert/domain/skill_category_model/skill_category_model.dart';

part 'final_resume_model_class.freezed.dart';
part 'final_resume_model_class.g.dart';

@freezed
class FinalResumeModelClass with _$FinalResumeModelClass {
  const factory FinalResumeModelClass({
    required AchievementMasterModel achievements,
    required DeclarationMasterModel declarations,
    required EducationMasterModel education,
    required ExperienceMasterModel experience,
    required PersonalInfoModel personalInfo,
    required ProjectMasterModel projects,
    required SkillCategoryMasterModel  skills,
  }) = _FinalResumeModelClass;

  factory FinalResumeModelClass.fromJson(Map<String, dynamic> json) => _$FinalResumeModelClassFromJson(json);
}