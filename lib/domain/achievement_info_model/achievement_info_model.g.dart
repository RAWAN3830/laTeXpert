// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementMasterModelImpl _$$AchievementMasterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementMasterModelImpl(
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => AchievementInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AchievementMasterModelImplToJson(
        _$AchievementMasterModelImpl instance) =>
    <String, dynamic>{
      'achievements': instance.achievements,
    };

_$AchievementInfoModelImpl _$$AchievementInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementInfoModelImpl(
      title: json['title'] as String,
      link: json['link'] as String,
      issuer: json['issuer'] as String,
    );

Map<String, dynamic> _$$AchievementInfoModelImplToJson(
        _$AchievementInfoModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'issuer': instance.issuer,
    };
