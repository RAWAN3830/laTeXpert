import 'package:flutter/material.dart';

import '../../../domain/achievement_info_model/achievement_info_model.dart';

class AchievementService {

  AchievementInitialData initialize() {
    List<Map<String, TextEditingController>> controllersList = [
      {
        'title': TextEditingController(),
        'link': TextEditingController(),
        'issuer': TextEditingController(),
      }
    ];
    List<bool> expansionStates = [true];

    return AchievementInitialData(controllersList, expansionStates);
  }


  // Add a new achievement field
  List<Map<String, TextEditingController>> addAchievementField(
      List<Map<String, TextEditingController>> controllersList) {
    if (controllersList.length < 4) {
      return List.from(controllersList)
        ..add({
          'title': TextEditingController(),
          'link': TextEditingController(),
          'issuer': TextEditingController(),
        });
    }
    return controllersList;
  }

  // Delete an achievement field
  List<Map<String, TextEditingController>> deleteAchievementField(
      List<Map<String, TextEditingController>> controllersList, int index) {
    if (index >= 0 && index < controllersList.length) {
      return List.from(controllersList)..removeAt(index);
    }
    return controllersList;
  }



  // Add a new expansion state
  List<bool> addExpansionState(List<bool> expansionStates) {
    return List.from(expansionStates)..add(true);
  }

  // Delete an expansion state
  List<bool> deleteExpansionState(List<bool> expansionStates, int index) {
    if (index >= 0 && index < expansionStates.length) {
      return List.from(expansionStates)..removeAt(index);
    }
    return expansionStates;
  }

  // Update an expansion state
  List<bool> updateExpansionState(List<bool> expansionStates, int index, bool isExpanded) {
    return List.from(expansionStates)..[index] = isExpanded;
  }

  // Save achievements locally
  Future<AchievementMasterModel> saveAchievements(
      List<Map<String, TextEditingController>> controllersList) async {
    final achievements = controllersList.map((controllers) {
      return AchievementInfoModel(
        title: controllers['title']!.text,
        link: controllers['link']!.text,
        issuer: controllers['issuer']!.text,
      );
    }).toList();

    return AchievementMasterModel(achievements: achievements);
  }

  // Dispose controllers
  void disposeControllers(List<Map<String, TextEditingController>> controllersList) {
    for (var controllers in controllersList) {
      for (var controller in controllers.values) {
        controller.dispose();
      }
    }
  }
}

class AchievementInitialData {
  final List<Map<String, TextEditingController>> controllersList;
  final List<bool> expansionStates;

  AchievementInitialData(this.controllersList, this.expansionStates);
}