import 'package:flutter_bloc/flutter_bloc.dart';
import 'skills_set_state.dart';
import 'package:latexpert/infra/services/skillset/skills_repository.dart';

class SkillsSetBlocCubit extends Cubit<SkillsSetState> {
  final SkillsRepository skillsRepository = SkillsRepository();

  SkillsSetBlocCubit() : super(SkillsSetState.initial());

  void addSkill(String category, String skill) {
    final updatedCategories = state.skillCategories.map((categoryModel) {
      if (categoryModel.name == category) {
        final updatedSkills = [...categoryModel.skills, skill];
        return categoryModel.copyWith(skills: updatedSkills);
      }
      return categoryModel;
    }).toList();

    emit(state.copyWith(skillCategories: updatedCategories));
  }

  void removeSkill(String category, String skill) {
    final updatedCategories = state.skillCategories.map((categoryModel) {
      if (categoryModel.name == category) {
        final updatedSkills = [...categoryModel.skills]..remove(skill);
        return categoryModel.copyWith(skills: updatedSkills);
      }
      return categoryModel;
    }).toList();

    emit(state.copyWith(skillCategories: updatedCategories));
  }

  void setSelectedCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  Map<String, dynamic> toJson() {
    final categoriesMap = {
      for (final category in state.skillCategories)
        category.name: category.skills,
    };

    return {
      "skills_info": {
        "categories": categoriesMap,
        "selectedCategory": state.selectedCategory,
      }
    };
  }

  Future<void> saveSkillsToServer() async {
    final data = toJson();
    await skillsRepository.registerSkills(data);
  }
}
