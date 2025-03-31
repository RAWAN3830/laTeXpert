import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/project_info_model/project_info_model.dart';
import '../../services/project_service/project_service.dart';
import 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectService _service;

  ProjectCubit(this._service) : super(const ProjectState.init()) {
    _initializeFields();
  }

  /// Initialize with one empty project entry
  void _initializeFields() {
    emit(ProjectState.success(
      projectData: ProjectMasterModel(projectMasterModel: [_emptyProject()]),
      expandedIndex: null,
    ));
  }

  /// Add a new project entry
  void addProjectFieldSet() {
    state.maybeWhen(
      success: (projectData, expandedIndex) {
        if (_service.canAddProject(projectData.projectMasterModel.length)) {
          final updatedProjects = List<ProjectInfoModel>.from(projectData.projectMasterModel)
            ..add(_emptyProject());

          emit(ProjectState.success(
            projectData: projectData.copyWith(projectMasterModel: updatedProjects),
            expandedIndex: null,
          ));
        }
      },
      orElse: () {},
    );
  }

  /// Remove a project entry by index
  void removeProjectFieldSet(int index) {
    state.maybeWhen(
      success: (projectData, expandedIndex) {
        if (projectData.projectMasterModel.length > 1) {
          final updatedProjects = List<ProjectInfoModel>.from(projectData.projectMasterModel)
            ..removeAt(index);

          emit(ProjectState.success(
            projectData: projectData.copyWith(projectMasterModel: updatedProjects),
            expandedIndex: expandedIndex == index ? null : expandedIndex,
          ));
        }
      },
      orElse: () {},
    );
  }

  /// Toggle expansion state
  void toggleExpansion(int index, bool isExpanded) {
    state.maybeWhen(
      success: (projectData, expandedIndex) {
        emit(ProjectState.success(
          projectData: projectData,
          expandedIndex: isExpanded ? index : null,
        ));
      },
      orElse: () {},
    );
  }

  /// Reset all fields to default
  void resetFields() {
    emit(ProjectState.success(
      projectData: ProjectMasterModel(projectMasterModel: [_emptyProject()]),
      expandedIndex: null,
    ));
  }

  /// Returns an empty project model
  ProjectInfoModel _emptyProject() {
    return const ProjectInfoModel(
      projectTitle: '',
      technologiesUsed: '',
      projectLink: '',
      projectDescription: '',
    );
  }
}
