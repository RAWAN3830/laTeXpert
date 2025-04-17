import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/domain/achievement_info_model/achievement_info_model.dart';
import 'package:latexpert/domain/achievement_info_model/achievement_controller.dart';

class AchievementService {
  final Dio dio = Dio();
  final String baseUrl = "${Strings.baseUrl}achievement_info";

  final List<AchievementInfoModel> _achievementList = [];
  List<AchievementControllers> controllersList = [];
  List<bool> expansionStates = [];

  // Initialize with one field
  void initialize() {
    controllersList = [
      AchievementControllers(
        title: TextEditingController(),
        link: TextEditingController(),
        issuer: TextEditingController(),
      )
    ];
    expansionStates = [true];
  }

  // Register achievement details via API
  Future<void> registerAchievements(List<AchievementInfoModel> achievementList) async {
    final token = await Strings.secureStorage.read(key: 'jwt_token');
    if (token == null) {
      throw Exception('Token not found. Please log in again.');
    }

    final Map<String, dynamic> achievementData = {
      "achievementList": achievementList,
    };

    try {
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: achievementData,
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to save achievement details: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Add new achievement field
  void addAchievementField() {
    if (controllersList.length < 4) {
      controllersList.add(
        AchievementControllers(
          title: TextEditingController(),
          link: TextEditingController(),
          issuer: TextEditingController(),
        ),
      );
      expansionStates.add(true);
    }
  }

  // Delete an achievement field
  void deleteAchievementField(int index) {
    if (index >= 0 && index < controllersList.length) {
      controllersList[index].dispose();
      controllersList.removeAt(index);
      expansionStates.removeAt(index);
      _achievementList.removeAt(index);
    }
  }

  // Update expansion state
  void updateExpansionState(int index, bool isExpanded) {
    if (index >= 0 && index < expansionStates.length) {
      expansionStates[index] = isExpanded;
    }
  }

  // Convert controller values to model list
  List<AchievementInfoModel> convertControllersToAchievementModel() {
    return controllersList.map((controller) {
      return AchievementInfoModel(
        title: controller.title.text,
        link: controller.link.text,
        issuer: controller.issuer.text,
      );
    }).toList();
  }

  // Dispose all controllers
  void disposeControllers(List<AchievementControllers> controllersList) {
    for (var controller in controllersList) {
      controller.dispose();
    }
    controllersList.clear();
    expansionStates.clear();
    _achievementList.clear();
  }
}
