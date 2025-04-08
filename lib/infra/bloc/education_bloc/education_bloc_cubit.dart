import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/infra/services/education_service/education_service.dart';
import 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  final EducationService _educationService = EducationService();

  EducationCubit()
      : super(const EducationState.initial()) {
    addEducationField();
  }

  void addEducationField() {
    _educationService.addEducationField();
    _emitSuccessState();
  }

  void deleteEducationField(int index) {
    _educationService.deleteEducationField(index);
    _emitSuccessState();
  }

  void updateExpansionState(int index, bool isExpanded) {
    _educationService.updateExpansionState(index, isExpanded);
    _emitSuccessState();
  }

  Future<void> registerEducation() async {
    emit(const EducationState.inProgress());
    try {
      await _educationService.registerEducation();
      emit(EducationState.success(
          educationList: _educationService.getEducationList()));
    } catch (e) {
      emit(EducationState.failure(errorMessage: e.toString()));
    }
  }

  void _emitSuccessState() {
    emit(EducationState.success(
        educationList: _educationService.getEducationList()));
  }

  @override
  Future<void> close() {
    for (var controllers in _educationService.controllersList) {
      for (var controller in controllers.values) {
        controller.dispose();
      }
    }
    return super.close();
  }

  List<Map<String, TextEditingController>> get controllersList =>
      _educationService.controllersList;

  List<bool> get expansionStates => _educationService.expansionStates;
}
