// lib/infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/infra/services/skillset/skills_repository.dart';
import 'skills_set_state.dart';

class SkillsSetBlocCubit extends Cubit<SkillsSetState> {

  SkillsSetBlocCubit() : super(SkillsSetState.initial());

  void addSkill(String category, String skill) {
    final updatedCategories = state.skillCategories.map((e) {
      if (e.name == category && !e.skills.contains(skill)) {
        return e.copyWith(skills: [...e.skills, skill]);
      }
      return e;
    }).toList();
    emit(state.copyWith(skillCategories: updatedCategories));
  }

  void removeSkill(String category, String skill) {
    final updatedCategories = state.skillCategories.map((e) {
      if (e.name == category) {
        return e.copyWith(skills: e.skills.where((s) => s != skill).toList());
      }
      return e;
    }).toList();
    emit(state.copyWith(skillCategories: updatedCategories));
  }
}