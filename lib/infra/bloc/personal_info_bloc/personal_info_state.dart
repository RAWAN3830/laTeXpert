import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latexpert/domain/personal_info_model/personal_info_model.dart';

part 'personal_info_state.freezed.dart';

@freezed
class PersonalInfoState with _$PersonalInfoState {
  const factory PersonalInfoState.initial() = _PersonalInfoStateInitial;

  const factory PersonalInfoState.inProgress() = _PersonalInfoStateInProgress;

  const factory PersonalInfoState.success({
    required PersonalInfoModel personalInfoModel,
  }) = _PersonalInfoStateSuccess;

  const factory PersonalInfoState.failure({
    String? errorMessage,
  }) = _PersonalInfoStateFailure;
}
