import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_category_model.freezed.dart';
part 'skill_category_model.g.dart';

@freezed
class SkillCategoryMasterModel with _$SkillCategoryMasterModel {
  const factory SkillCategoryMasterModel({
    required List<SkillCategoryModel> skillCategories,
  }) = _SkillCategoryMasterModel;

  factory SkillCategoryMasterModel.fromJson(Map<String, dynamic> json) => _$SkillCategoryMasterModelFromJson(json);
}

@freezed
class SkillCategoryModel with _$SkillCategoryModel {
  const factory SkillCategoryModel({
    required String name,
    required List<String> skills,
  }) = _SkillCategoryModel;

  factory SkillCategoryModel.fromJson(Map<String, dynamic> json) => _$SkillCategoryModelFromJson(json);
}
