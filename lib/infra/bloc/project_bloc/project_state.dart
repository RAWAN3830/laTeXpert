import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latexpert/domain/project_info_model/project_info_model.dart';


part 'project_state.freezed.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = ProjectStateInitial;

  const factory ProjectState.loading() = ProjectStateLoading;

  const factory ProjectState.success(
      {required List<ProjectInfoModel> projectList}) = ProjectStateSuccess;

  const factory ProjectState.failure({ required String errorMessage}) = ProjectStateError;
}
