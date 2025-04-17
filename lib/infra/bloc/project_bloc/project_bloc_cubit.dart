import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/domain/project_info_model/project_controller.dart';
import 'package:latexpert/domain/project_info_model/project_info_model.dart';
import 'package:latexpert/infra/bloc/project_bloc/project_state.dart';
import 'package:latexpert/infra/services/project_service/project_service.dart';

class ProjectBlocCubit extends Cubit<ProjectState> {
  final ProjectService _projectService = ProjectService();

  ProjectBlocCubit() : super(const ProjectState.initial()) {
    addProjectField(); // Initialize with a default experience field
  }

  // Add a new experience field
  void addProjectField() {
    _projectService.addProjectField();
    _emitSuccessState();
  }

  // Delete an existing experience field by index
  void deleteProjectField(int index) {
    _projectService.deleteProjectField(index);
    _emitSuccessState();
  }

  // Update the expansion state of an experience field by index
  void updateExpansionState(int index, bool isExpanded) {
    _projectService.updateExpansionState(index, isExpanded);
    _emitSuccessState();
  }

  // Register experience details with API call
  Future<void> registerProject(BuildContext context, List<ProjectInfoModel> projectList) async {
    emit(const ProjectState.loading()); // Emit loading state

    try {
      await _projectService.registerProject(projectList); // Call the service to register experience
      emit(ProjectState.success(projectList: projectList)); // Emit success state
    } catch (e) {
      emit(ProjectState.failure(errorMessage: e.toString())); // Emit failure state
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Helper method to emit success state with updated experience list
  void _emitSuccessState() {
    // Convert controllers to experienceModel before emitting success state
    final projectList = _projectService.convertControllersToProjectInfoModel();
    emit(ProjectState.success(projectList: projectList));
  }

  // Clean up resources when cubit is closed
  @override
  Future<void> close() {
    // Dispose of all controllers when the cubit is closed to avoid memory leaks
    for (var controllers in _projectService.controllersList) {
      for (var controller in controllers.getControllers()) {
        controller.dispose();
      }
    }
    return super.close();
  }

  // Getters to access the controllers and expansion states
  List<ProjectControllers> get controllersList => _projectService.controllersList;

  List<bool> get expansionStates => _projectService.expansionStates;
}
