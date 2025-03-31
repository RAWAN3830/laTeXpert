// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resume/domain/experience_model/experience_model.dart';
// import 'package:resume/infra/bloc/experiences_bloc/experiences_state.dart';
// import 'package:resume/infra/services/experience_service/experience_service.dart';
// import 'package:flutter/material.dart';
//
//
// class ExperienceCubit extends Cubit<ExperienceState> {
//   final ExperienceService _experienceService = ExperienceService();
//
//   ExperienceCubit() : super(const ExperienceState.initial());
//   List<Map<String, TextEditingController>> getControllersList() => _controllersList;
//   List<bool> getExpansionStates() => _expansionStates;
//
//   List<Map<String, TextEditingController>> _controllersList = [];
//   List<bool> _expansionStates = [];
//
//   void initialize() {
//     _controllersList = [];
//     _expansionStates = [];
//
//     emit(const ExperienceState.success(
//       experienceMasterModel: ExperienceMasterModel(experiences: []),
//     ));
//   }
//
//   void addExperienceField() {
//     _controllersList = _experienceService.addExperienceField(_controllersList);
//     _expansionStates = _experienceService.addExpansionState(_expansionStates);
//
//     _updateState();
//   }
//
//   void deleteExperienceField(int index) {
//     _controllersList = _experienceService.deleteExperienceField(_controllersList, index);
//     _expansionStates = _experienceService.deleteExpansionState(_expansionStates, index);
//
//     _updateState();
//   }
//
//   Future<void> saveExperience() async {
//     final experienceMasterModel = await _experienceService.saveExperience(_controllersList);
//       emit(ExperienceState.success(experienceMasterModel: experienceMasterModel));
//   }
//
//   void updateExpansionState(int index, bool isExpanded) {
//     _expansionStates = _experienceService.updateExpansionState(_expansionStates, index, isExpanded);
//     _updateState();
//   }
//
//   void _updateState() {
//     final experiences = _controllersList.map((controllers) {
//       return ExperienceModel(
//         employer: controllers['employer']!.text,
//         jobTitle: controllers['jobTitle']!.text,
//         location: controllers['location']!.text,
//         startDate: controllers['startDate']!.text.isNotEmpty
//             ? DateTime.tryParse(controllers['startDate']!.text) ?? DateTime.now()
//             : DateTime.now(),
//         endDate: controllers['endDate']!.text.isNotEmpty
//             ? DateTime.tryParse(controllers['endDate']!.text) ?? DateTime.now()
//             : DateTime.now(),
//         description: controllers['description']!.text,
//       );
//     }).toList();
//
//     emit(ExperienceState.success(
//       experienceMasterModel: ExperienceMasterModel(experiences: experiences),
//     ));
//   }
//
//
//
//   @override
//   Future<void> close() {
//     _experienceService.disposeControllers(_controllersList);
//     return super.close();
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/domain/experience_model/experience_model.dart';
import 'package:latexpert/infra/bloc/experiences_bloc/experiences_state.dart';
import 'package:latexpert/infra/services/experience_service/experience_service.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/domain/experience_model/experience_controller.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  final ExperienceService _experienceService = ExperienceService();

  ExperienceCubit() : super(const ExperienceState.initial());
  List<ExperienceControllers> getControllersList() => _controllersList;
  List<bool> getExpansionStates() => _expansionStates;

  List<ExperienceControllers> _controllersList = [];
  List<bool> _expansionStates = [];

  void initialize() {
    _controllersList = [];
    _expansionStates = [];

    emit(const ExperienceState.success(
      experienceMasterModel: ExperienceMasterModel(experiences: []),
    ));
  }

  void addExperienceField() {
    _controllersList.add(
      ExperienceControllers(
        employer: TextEditingController(),
        jobTitle: TextEditingController(),
        location: TextEditingController(),
        startDate: TextEditingController(),
        endDate: TextEditingController(),
        description: TextEditingController(),
      ),
    );
    _expansionStates.add(false);
    _updateState();
  }

  void deleteExperienceField(int index) {
    _controllersList.removeAt(index);
    _expansionStates.removeAt(index);
    _updateState();
  }

  // Future<void> saveExperience() async {
  //   final experienceMasterModel = await _experienceService.saveExperience(_controllersList);
  //   emit(ExperienceState.success(experienceMasterModel: experienceMasterModel));
  // }

  void updateExpansionState(int index, bool isExpanded) {
    _expansionStates[index] = isExpanded;
    _updateState();
  }

  void _updateState() {
    final experiences = _controllersList.map((controllers) {
      return ExperienceModel(
        employer: controllers.employer.text,
        jobTitle: controllers.jobTitle.text,
        location: controllers.location.text,
        startDate: controllers.startDate.text.isNotEmpty
            ? DateTime.tryParse(controllers.startDate.text) ?? DateTime.now()
            : DateTime.now(),
        endDate: controllers.endDate.text.isNotEmpty
            ? DateTime.tryParse(controllers.endDate.text) ?? DateTime.now()
            : DateTime.now(),
        description: controllers.description.text,
      );
    }).toList();

    emit(ExperienceState.success(
      experienceMasterModel: ExperienceMasterModel(experiences: experiences),
    ));
  }

  @override
  Future<void> close() {
    for (var controllers in _controllersList) {
      controllers.employer.dispose();
      controllers.jobTitle.dispose();
      controllers.location.dispose();
      controllers.startDate.dispose();
      controllers.endDate.dispose();
      controllers.description.dispose();
    }
    return super.close();
  }
}