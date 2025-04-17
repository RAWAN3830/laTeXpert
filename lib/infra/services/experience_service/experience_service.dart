import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/domain/education_model/education_controllers.dart';
import 'package:latexpert/domain/education_model/education_model.dart';
import 'package:latexpert/domain/experience_model/experience_controller.dart';
import 'package:latexpert/domain/experience_model/experience_model.dart';

class ExperienceService {
  final Dio dio = Dio();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final String baseUrl = "${Strings.baseUrl}experience_info";  // Change this URL as needed

  List<ExperienceModel> _experienceList = [];

  // A list of controllers for each education field (used to handle form inputs)
  List<ExperienceController> controllersList = [];

  // A list to manage the expansion state of each education field (for UI purposes)
  List<bool> expansionStates = [];

  // Register education details
  Future<void> registerExperience(List<ExperienceModel> experienceList) async {
    final token = await secureStorage.read(key: 'jwt_token');
    if (token == null) {
      throw Exception('Token not found. Please log in again.');
    }

    final Map<String, dynamic> experienceData = {
      "experienceList": experienceList,
    };

    try {
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: experienceData,
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to save education details: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Method to add a new education field
  void addExperienceField() {
    final controllers = ExperienceController(
      employer: TextEditingController(),
      location: TextEditingController(),
      description: TextEditingController(),
       jobTitle: TextEditingController(),
      startDate: TextEditingController(),
      endDate: TextEditingController(),
    );

    controllersList.add(controllers);
    expansionStates.add(false);  // Initially, the education field will not be expanded
  }

  // Method to delete an existing education field by index
  void deleteExperienceField(int index) {
    if (index >= 0 && index < controllersList.length) {
      controllersList[index].dispose();
      controllersList.removeAt(index);
      expansionStates.removeAt(index);
      _experienceList.removeAt(index); // Also remove from the education list
    }
  }

  // Method to update the expansion state of an education field by index
  void updateExpansionState(int index, bool isExpanded) {
    if (index >= 0 && index < expansionStates.length) {
      expansionStates[index] = isExpanded;
    }
  }

  // Method to get the current list of education fields
  List<ExperienceModel> getExperienceList() {
    return _experienceList;
  }

  // Helper method to convert controllers to EducationModel (for easy use in UI)
  List<ExperienceModel> convertControllersToExperienceModel() {
    return controllersList.map((controllers) {
      return ExperienceModel(
        employer: controllers.employer.text ?? '',
        location: controllers.location.text ?? '',
        jobTitle: controllers.jobTitle.text ?? '',
        description: controllers.description.text ?? '',
        startDate: controllers.startDate.text ?? '',
        endDate: controllers.endDate.text ?? '',
      );
    }).toList();
  }
}
