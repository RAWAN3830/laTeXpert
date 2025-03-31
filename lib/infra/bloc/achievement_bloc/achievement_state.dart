// achievement_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'achievement_state.freezed.dart';

@freezed
class AchievementState with _$AchievementState {
  const factory AchievementState.initial() = _AchievementStateInitial;
  const factory AchievementState.success({
    required List<Map<String, TextEditingController>> controllersList,
    required List<bool> expansionStates,
  }) = _AchievementStateSuccess;
}