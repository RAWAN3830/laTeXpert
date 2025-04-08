// lib/infra/bloc/skills_set_bloc/skills_set_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_set_state.freezed.dart';

@freezed
class SkillsSetState with _$SkillsSetState {
  // Initial state
  const factory SkillsSetState.initial() = SkillsSetStateInitial;

  // Loading state
  const factory SkillsSetState.loading() = SkillsSetStateLoading;

  // Success state
  const factory SkillsSetState.success({
    required Map<String, List<String>> categories,
    required String selectedCategories,
  }) = SkillsSetStateSuccess;

  // Failure state
  const factory SkillsSetState.failure({
    required String errorMessage,
  }) = SkillsSetStateFailure;
}