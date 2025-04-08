// lib/infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/infra/services/skillset/skills_repository.dart';
import 'skills_set_state.dart';

class SkillsSetBlocCubit extends Cubit<SkillsSetState> {
  final SkillsService _skillsService;

  SkillsSetBlocCubit({SkillsService? skillsService})
      : _skillsService = skillsService ?? SkillsService(),
        super(const SkillsSetState.initial()) {
    // Note: We'll need context to be passed in methods instead of here
  }

  Future<void> loadSkills(BuildContext context) async {
    emit(const SkillsSetState.loading());
    try {
      final data = await _skillsService.fetchSkills(context);
      final categories = (data['categories'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, List<String>.from(value)));
      final selectedCategories = data['selectedCategories'] as String;
      emit(SkillsSetState.success(
        categories: categories,
        selectedCategories: selectedCategories,
      ));
    } catch (e) {
      emit(SkillsSetState.failure(errorMessage: e.toString()));
    }
  }

  void addSkill(BuildContext context, String category, String skill) async {
    state.when(
      success: (categories, selectedCategories) async {
        try {
          await _skillsService.addSkill(context, category, skill);
          final updatedCategories = Map<String, List<String>>.from(categories);
          if (updatedCategories[category] != null) {
            updatedCategories[category] = [...updatedCategories[category]!, skill];
          } else {
            updatedCategories[category] = [skill];
          }
          emit(SkillsSetState.success(
            categories: updatedCategories,
            selectedCategories: selectedCategories,
          ));
        } catch (e) {
          emit(SkillsSetState.failure(errorMessage: e.toString()));
        }
      },
      initial: () {},
      loading: () {},
      failure: (_) {},
    );
  }

  void removeSkill(BuildContext context, String category, String skill) async {
    state.when(
      success: (categories, selectedCategories) async {
        try {
          await _skillsService.removeSkill(context, category, skill);
          final updatedCategories = Map<String, List<String>>.from(categories);
          updatedCategories[category] = updatedCategories[category]!
              .where((s) => s != skill)
              .toList();
          emit(SkillsSetState.success(
            categories: updatedCategories,
            selectedCategories: selectedCategories,
          ));
        } catch (e) {
          emit(SkillsSetState.failure(errorMessage: e.toString()));
        }
      },
      initial: () {},
      loading: () {},
      failure: (_) {},
    );
  }

  void updateSelectedCategory(BuildContext context, String category) async {
    state.when(
      success: (categories, _) async {
        try {
          await _skillsService.updateSelectedCategory(context, category);
          emit(SkillsSetState.success(
            categories: categories,
            selectedCategories: category,
          ));
        } catch (e) {
          emit(SkillsSetState.failure(errorMessage: e.toString()));
        }
      },
      initial: () {},
      loading: () {},
      failure: (_) {},
    );
  }
}