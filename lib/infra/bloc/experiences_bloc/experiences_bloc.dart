import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/domain/experience_model/experience_controller.dart';
import 'package:latexpert/domain/experience_model/experience_model.dart';
import 'package:latexpert/infra/bloc/experiences_bloc/experiences_state.dart';
import 'package:latexpert/infra/services/experience_service/experience_service.dart';

class ExperiencesBlocCubit extends Cubit<ExperienceState> {
    final ExperienceService experienceService = ExperienceService();

  ExperiencesBlocCubit() : super(const ExperienceState.initial()) {
    addExperienceField(); // Initialize with a default experience field
  }

  // Add a new experience field
  void addExperienceField() {
    experienceService.addExperienceField();
    _emitSuccessState();
  }

  // Delete an existing experience field by index
  void deleteExperienceField(int index) {
    experienceService.deleteExperienceField(index);
    _emitSuccessState();
  }

  // Update the expansion state of an experience field by index
  void updateExpansionState(int index, bool isExpanded) {
    experienceService.updateExpansionState(index, isExpanded);
    _emitSuccessState();
  }

  // Register experience details with API call
  Future<void> registerExperience(BuildContext context, List<ExperienceModel> experienceList) async {
    emit(const ExperienceState.loading()); // Emit loading state

    try {
      await experienceService.registerExperience(experienceList); // Call the service to register experience
      emit(ExperienceState.success(experienceList: experienceList)); // Emit success state
    } catch (e) {
      emit(ExperienceState.failure(errorMessage: e.toString())); // Emit failure state
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Helper method to emit success state with updated experience list
  void _emitSuccessState() {
    // Convert controllers to experienceModel before emitting success state
    final experienceList = experienceService.convertControllersToExperienceModel();
    emit(ExperienceState.success(experienceList: experienceList));
  }

  // Clean up resources when cubit is closed
  @override
  Future<void> close() {
    // Dispose of all controllers when the cubit is closed to avoid memory leaks
    for (var controllers in experienceService.controllersList) {
      for (var controller in controllers.getControllers()) {
        controller.dispose();
      }
    }
    return super.close();
  }

  // Getters to access the controllers and expansion states
  List<ExperienceController> get controllersList => experienceService.controllersList;

  List<bool> get expansionStates => experienceService.expansionStates;
}
