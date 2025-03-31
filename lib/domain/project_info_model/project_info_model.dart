import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_info_model.freezed.dart';
part 'project_info_model.g.dart';

@freezed
class ProjectMasterModel with _$ProjectMasterModel {
  const factory ProjectMasterModel({
    required List<ProjectInfoModel> projectMasterModel,
  }) = _ProjectMasterModel;

  factory ProjectMasterModel.fromJson(Map<String, dynamic> json) => _$ProjectMasterModelFromJson(json);
}


@freezed
class ProjectInfoModel with _$ProjectInfoModel {
  const factory ProjectInfoModel({
    required String projectTitle,
    required String technologiesUsed,
    required String projectLink,
    required String projectDescription,
  }) = _ProjectInfoModel;

  factory ProjectInfoModel.fromJson(Map<String, dynamic> json) => _$ProjectInfoModelFromJson(json);
}
