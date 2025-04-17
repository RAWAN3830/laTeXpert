import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latexpert/domain/achievement_info_model/achievement_info_model.dart';

part 'achievement_state.freezed.dart';

@freezed
class AchievementState with _$AchievementState {
  const factory AchievementState.initial() = AchievementStateInitial;

  const factory AchievementState.loading() = AchievementStateLoading;

  const factory AchievementState.success({
    required List<AchievementInfoModel> achievementList,
  }) = AchievementStateSuccess;

  const factory AchievementState.failure({
    required String errorMessage,
  }) = AchievementStateError;
}
