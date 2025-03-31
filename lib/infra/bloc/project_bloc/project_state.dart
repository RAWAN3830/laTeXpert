import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/project_info_model/project_info_model.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.init() = InitState;
  const factory ProjectState.success({
    required ProjectMasterModel projectData,
    required int? expandedIndex,
  }) = SuccessState;
}
