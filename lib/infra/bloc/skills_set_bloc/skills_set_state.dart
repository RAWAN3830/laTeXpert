
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latexpert/domain/skill_category_model/skill_category_model.dart';

part 'skills_set_state.freezed.dart';

@freezed
class SkillsSetState with _$SkillsSetState {
  const factory SkillsSetState({
    required List<SkillCategoryModel> skillCategories,
    required String selectedCategory,
  }) = _SkillsSetState;

  factory SkillsSetState.initial() =>const SkillsSetState(
    skillCategories: [
      SkillCategoryModel(name: 'Databases',  skills: []),
      SkillCategoryModel(name: 'Frameworks', skills: []),
      SkillCategoryModel(name: 'Programming Languages', skills: []),
    ], selectedCategory: '',
  );
}
