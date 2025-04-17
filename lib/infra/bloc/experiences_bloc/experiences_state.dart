import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latexpert/domain/experience_model/experience_model.dart';


part 'experiences_state.freezed.dart';

@freezed
class ExperienceState with _$ExperienceState {
  const factory ExperienceState.initial() = ExperienceStateInitial;

  const factory ExperienceState.loading() = ExperienceStateLoading;

  const factory ExperienceState.success(
      {required List<ExperienceModel> experienceList}) = ExperienceStateSuccess;

  const factory ExperienceState.failure({ required String errorMessage}) = ExperienceStateError;
}
