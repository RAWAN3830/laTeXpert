import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/domain/education_model/education_controllers.dart';
import 'package:latexpert/domain/education_model/education_model.dart';
import 'package:latexpert/infra/services/education_service/education_service.dart';
import 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  final EducationService _educationService = EducationService();

  EducationCubit() : super(const EducationState.initial()) {
    addEducationField(); // Initialize with a default education field
  }

  // Add a new education field
  void addEducationField() {
    _educationService.addEducationField();
    _emitSuccessState();
  }

  // Delete an existing education field by index
  void deleteEducationField(int index) {
    _educationService.deleteEducationField(index);
    _emitSuccessState();
  }

  // Update the expansion state of an education field by index
  void updateExpansionState(int index, bool isExpanded) {
    _educationService.updateExpansionState(index, isExpanded);
    _emitSuccessState();
  }

  // Register education details with API call
  Future<void> registerEducation(BuildContext context, List<EducationModel> educationList) async {
    emit(const EducationState.inProgress()); // Emit loading state

    try {
      await _educationService.registerEducation(educationList); // Call the service to register education
      emit(EducationState.success(educationList: educationList)); // Emit success state
    } catch (e) {
      emit(EducationState.failure(errorMessage: e.toString())); // Emit failure state
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Helper method to emit success state with updated education list
  void _emitSuccessState() {
    // Convert controllers to EducationModel before emitting success state
    final educationList = _educationService.convertControllersToEducationModel();
    emit(EducationState.success(educationList: educationList));
  }

  // Clean up resources when cubit is closed
  @override
  Future<void> close() {
    // Dispose of all controllers when the cubit is closed to avoid memory leaks
    for (var controllers in _educationService.controllersList) {
        for (var controller in controllers.getControllers()) {
        controller.dispose();
      }
    }
    return super.close();
  }

  // Getters to access the controllers and expansion states
  List<EducationControllers> get controllersList => _educationService.controllersList;

  List<bool> get expansionStates => _educationService.expansionStates;
}
