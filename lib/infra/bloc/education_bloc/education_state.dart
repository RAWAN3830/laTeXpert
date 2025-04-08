import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latexpert/domain/education_model/education_model.dart';

part 'education_state.freezed.dart';

@freezed
class EducationState with _$EducationState {
  const factory EducationState.initial() = _EducationStateInitial;

  const factory EducationState.inProgress() = _EducationStateInProgress;

  const factory EducationState.success({
    required List<EducationModel> educationList,
  }) = _EducationStateSuccess;

  const factory EducationState.failure({
    String? errorMessage,
  }) = _EducationStateFailure;
}
