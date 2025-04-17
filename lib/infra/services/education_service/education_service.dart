import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/domain/education_model/education_controllers.dart';
import 'package:latexpert/domain/education_model/education_model.dart';

class EducationService {
  final Dio dio = Dio();
  final String baseUrl = "${Strings.baseUrl}education_info";  // Change this URL as needed

  final List<EducationModel> _educationList = [];

  // A list of controllers for each education field (used to handle form inputs)
  List<EducationControllers> controllersList = [];

  // A list to manage the expansion state of each education field (for UI purposes)
  List<bool> expansionStates = [];

  // Register education details
  Future<void> registerEducation(List<EducationModel> educationList) async {
    final token = await Strings.secureStorage.read(key: 'jwt_token');
    if (token == null) {
      throw Exception('Token not found. Please log in again.');
    }

    final Map<String, dynamic> educationData = {
      "educationList": educationList,
    };

    try {
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: educationData,
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to save education details: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Method to add a new education field
  void addEducationField() {
    final controllers = EducationControllers(
      institution: TextEditingController(),
      location: TextEditingController(),
      degreeType: TextEditingController(),
      fieldOfStudy: TextEditingController(),
      startDate: TextEditingController(),
      endDate: TextEditingController(),
    );

    controllersList.add(controllers);
    expansionStates.add(false);  // Initially, the education field will not be expanded
  }

  // Method to delete an existing education field by index
  void deleteEducationField(int index) {
    if (index >= 0 && index < controllersList.length) {
      controllersList[index].dispose();
      controllersList.removeAt(index);
      expansionStates.removeAt(index);
      _educationList.removeAt(index); // Also remove from the education list
    }
  }

  // Method to update the expansion state of an education field by index
  void updateExpansionState(int index, bool isExpanded) {
    if (index >= 0 && index < expansionStates.length) {
      expansionStates[index] = isExpanded;
    }
  }

  // Method to get the current list of education fields
  List<EducationModel> getEducationList() {
    return _educationList;
  }

  // Helper method to convert controllers to EducationModel (for easy use in UI)
  List<EducationModel> convertControllersToEducationModel() {
    return controllersList.map((controllers) {
      return EducationModel(
        institution: controllers.institution.text ?? '',
        location: controllers.location.text ?? '',
        degreeType: controllers.degreeType.text ?? '',
        fieldOfStudy: controllers.fieldOfStudy.text ?? '',
        startDate: controllers.startDate.text ?? '',
        endDate: controllers.endDate.text ?? '',
      );
    }).toList();
  }
}
