import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/domain/education_model/education_controllers.dart';
import 'package:latexpert/domain/education_model/education_model.dart';
import 'package:latexpert/domain/experience_model/experience_controller.dart';
import 'package:latexpert/domain/experience_model/experience_model.dart';
import 'package:latexpert/infra/bloc/experiences_bloc/experiences_state.dart';
import 'package:latexpert/infra/services/education_service/education_service.dart';
import 'package:latexpert/infra/services/experience_service/experience_service.dart';

class ExperiencesBlocCubit extends Cubit<ExperienceState> {
    final ExperienceService experienceService = ExperienceService();

  ExperiencesBlocCubit() : super(const ExperienceState.initial()) {
    addExperienceField(); // Initialize with a default education field
  }

  // Add a new education field
  void addExperienceField() {
    experienceService.addExperienceField();
    _emitSuccessState();
  }

  // Delete an existing education field by index
  void deleteExperienceField(int index) {
    experienceService.deleteExperienceField(index);
    _emitSuccessState();
  }

  // Update the expansion state of an education field by index
  void updateExpansionState(int index, bool isExpanded) {
    experienceService.updateExpansionState(index, isExpanded);
    _emitSuccessState();
  }

  // Register education details with API call
  Future<void> registerExperience(BuildContext context, List<ExperienceModel> experienceList) async {
    emit(const ExperienceState.loading()); // Emit loading state

    try {
      await experienceService.registerExperience(experienceList); // Call the service to register education
      emit(ExperienceState.success(experienceList: experienceList)); // Emit success state
    } catch (e) {
      emit(ExperienceState.failure(errorMessage: e.toString())); // Emit failure state
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Helper method to emit success state with updated education list
  void _emitSuccessState() {
    // Convert controllers to EducationModel before emitting success state
    final educationList = experienceService.convertControllersToExperienceModel();
    emit(ExperienceState.success(experienceList: educationList));
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
