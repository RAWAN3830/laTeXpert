import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience_model.freezed.dart';
part 'experience_model.g.dart';

@freezed
class ExperienceMasterModel with _$ExperienceMasterModel {
  const factory ExperienceMasterModel({
    required List<ExperienceModel> experiences,
  }) = _ExperienceMasterModel;

  factory ExperienceMasterModel.fromJson(Map<String, dynamic> json) => _$ExperienceMasterModelFromJson(json);
}

@freezed
class ExperienceModel with _$ExperienceModel {
  const factory ExperienceModel({
    required String employer,
    required String jobTitle,
    required String location,
    required DateTime startDate,
    required DateTime endDate,
    required String description,
  }) = _ExperienceModel;

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => _$ExperienceModelFromJson(json);
}


