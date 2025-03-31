  // import 'package:freezed_annotation/freezed_annotation.dart';
  // import 'package:flutter/material.dart';
  //
  // part 'experiences_state.freezed.dart';
  //
  // @freezed
  // class ExperienceState with _$ExperienceState {
  //   const factory ExperienceState.initial() = ExperienceStateInitial;
  //
  //   const factory ExperienceState.loading() = ExperienceStateLoading;
  //
  //   const factory ExperienceState.success({
  //     required List<Map<String, TextEditingController>> controllersList,
  //     required List<bool> expansionStates,
  //   }) = ExperienceStateSuccess;
  //
  //   const factory ExperienceState.error({
  //     required String message,
  //   }) = ExperienceStateError;
  // }

// Run the following command to generate the necessary files:
// flutter pub run build_runner build --delete-conflicting-outputs


import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/experience_model/experience_model.dart';

part 'experiences_state.freezed.dart';

@freezed
class ExperienceState with _$ExperienceState {
  const factory ExperienceState.initial() = ExperienceStateInitial;

  const factory ExperienceState.success({
    required ExperienceMasterModel experienceMasterModel,
  }) = ExperienceStateSuccess;
}
