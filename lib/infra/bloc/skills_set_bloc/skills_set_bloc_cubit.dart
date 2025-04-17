// lib/infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/infra/services/skillset/skills_repository.dart';
import 'skills_set_state.dart';

class SkillsSetBlocCubit extends Cubit<SkillsSetState> {
  final SkillsService _skillsService;

  SkillsSetBlocCubit({SkillsService? skillsService})
      : _skillsService = skillsService ?? SkillsService(),
        super(const SkillsSetState.initial());

  Future<void> loadSkills(BuildContext context) async {
    emit(const SkillsSetState.loading());
    try {
      final data = await _skillsService.fetchSkills(context);
      final categories = (data['categories'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, List<String>.from(value)));
      final selectedCategory = data['selectedCategory'] as String;
      emit(SkillsSetState.success(
        categories: categories,
        selectedCategories: selectedCategory,
      ));
    } catch (e) {
      emit(SkillsSetState.failure(errorMessage: e.toString()));
    }
  }

  void addSkill(String category, String skill,BuildContext context) async {
    state.maybeWhen(
      success: (categories, selectedCategory) async {
        try {
          await _skillsService.addSkill(context,category, skill);
          final updatedCategories = Map<String, List<String>>.from(categories);
          if (updatedCategories[category] != null) {
            updatedCategories[category] = [...updatedCategories[category]!, skill];
          } else {
            updatedCategories[category] = [skill];
          }
          emit(SkillsSetState.success(
            categories: updatedCategories,
            selectedCategories: selectedCategory,
          ));
        } catch (e) {
          emit(SkillsSetState.failure(errorMessage: e.toString()));
        }
      },
      orElse: () {},
    );
  }

  void removeSkill(String category, String skill,BuildContext context) async {
    state.maybeWhen(
      success: (categories, selectedCategory) async {
        try {
          await _skillsService.removeSkill(context,category, skill);
          final updatedCategories = Map<String, List<String>>.from(categories);
          updatedCategories[category] = updatedCategories[category]!
              .where((s) => s != skill)
              .toList();
          emit(SkillsSetState.success(
            categories: updatedCategories,
            selectedCategories: selectedCategory,
          ));
        } catch (e) {
          emit(SkillsSetState.failure(errorMessage: e.toString()));
        }
      },
      orElse: () {},
    );
  }

  void updateSelectedCategory(BuildContext context,String category) async {
    state.maybeWhen(
      success: (categories, _) async {
        try {
          await _skillsService.updateSelectedCategory(context,category);
          emit(SkillsSetState.success(
            categories: categories,
            selectedCategories: category,
          ));
        } catch (e) {
          emit(SkillsSetState.failure(errorMessage: e.toString()));
        }
      },
      orElse: () {},
    );
  }
}