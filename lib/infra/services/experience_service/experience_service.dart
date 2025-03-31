import 'package:flutter/material.dart';
import 'package:latexpert/domain/experience_model/experience_model.dart'; // Import your model

class ExperienceService {
  List<Map<String, TextEditingController>> addExperienceField(List<Map<String, TextEditingController>> controllersList) {
    if (controllersList.length < 4) {
      return List.from(controllersList)
        ..add({
          'employer': TextEditingController(),
          'jobTitle': TextEditingController(),
          'location': TextEditingController(),
          'startDate': TextEditingController(),
          'endDate': TextEditingController(),
          'description': TextEditingController(),
        });
    }
    return controllersList;
  }

  List<Map<String, TextEditingController>> deleteExperienceField(List<Map<String, TextEditingController>> controllersList, int index) {
    if (index >= 0 && index < controllersList.length) {
      return List.from(controllersList)..removeAt(index);
    }
    return controllersList;
  }

  List<bool> addExpansionState(List<bool> expansionStates) {
    return List.from(expansionStates)..add(true);
  }

  List<bool> deleteExpansionState(List<bool> expansionStates, int index) {
    if (index >= 0 && index < expansionStates.length) {
      return List.from(expansionStates)..removeAt(index);
    }
    return expansionStates;
  }

  List<bool> updateExpansionState(List<bool> expansionStates, int index, bool isExpanded) {
    return List.from(expansionStates)..[index] = isExpanded;
  }

  // No Firebase interaction here anymore.
  Future<ExperienceMasterModel> saveExperience(List<Map<String, TextEditingController>> controllersList) async {
    final experiences = controllersList.map((controllers) {
      return ExperienceModel(
        employer: controllers['employer']!.text,
        jobTitle: controllers['jobTitle']!.text,
        location: controllers['location']!.text,
        startDate: DateTime.parse(controllers['startDate']!.text), // Parse DateTime
        endDate: DateTime.parse(controllers['endDate']!.text),     // Parse DateTime
        description: controllers['description']!.text,
      );
    }).toList();

    return ExperienceMasterModel(experiences: experiences);
  }

  void disposeControllers(List<Map<String, TextEditingController>> controllersList) {
    for (var controllers in controllersList) {
      for (var controller in controllers.values) {
        controller.dispose();
      }
    }
  }
}
