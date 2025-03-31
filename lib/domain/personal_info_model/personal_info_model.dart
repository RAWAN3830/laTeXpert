import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_info_model.freezed.dart';
part 'personal_info_model.g.dart';

@freezed
class PersonalInfoModel with _$PersonalInfoModel {
  const factory PersonalInfoModel({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String jobTitle,
    required String address,
    required List<Links> links,
  }) = _PersonalInfoModel;

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) => _$PersonalInfoModelFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    required String name,
    required String link,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}