import 'package:freezed_annotation/freezed_annotation.dart';
part 'achievement_info_model.freezed.dart';
part 'achievement_info_model.g.dart';

@freezed
class AchievementMasterModel with _$AchievementMasterModel {
  const factory AchievementMasterModel({
    required List<AchievementInfoModel> achievements,
  }) = _AchievementMasterModel;

  factory AchievementMasterModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementMasterModelFromJson(json);
}

@freezed
class AchievementInfoModel with _$AchievementInfoModel {
  const factory AchievementInfoModel({
    required String title,
    required String link,
    required String issuer,
  }) = _AchievementInfoModel;

  factory AchievementInfoModel.fromJson(Map<String, dynamic> json) => _$AchievementInfoModelFromJson(json);
}
