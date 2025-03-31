import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_model.freezed.dart';
part 'education_model.g.dart';

@freezed
class EducationMasterModel with _$EducationMasterModel {
  const factory EducationMasterModel({
    required List<EducationModel> education_info, // Updated to match schema
  }) = _EducationMasterModel;

  factory EducationMasterModel.fromJson(Map<String, dynamic> json) => _$EducationMasterModelFromJson(json);
}

@freezed
class EducationModel with _$EducationModel {
  const factory EducationModel({
    required String institution,
    required String location,
    required String degreeType,
    required String fieldOfStudy,
    required String startDate, // Store as String
    required String endDate, // Store as String
  }) = _EducationModel;

  factory EducationModel.fromJson(Map<String, dynamic> json) => _$EducationModelFromJson(json);
}
