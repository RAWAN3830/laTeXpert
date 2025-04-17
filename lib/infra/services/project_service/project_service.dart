import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latexpert/core/constant/strings.dart';

import 'package:latexpert/domain/project_info_model/project_controller.dart';
import 'package:latexpert/domain/project_info_model/project_info_model.dart';

class ProjectService {
  final Dio dio = Dio();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final String baseUrl = "${Strings.baseUrl}project_info";  // Change this URL as needed

  List<ProjectInfoModel> _projectList = [];

  // A list of controllers for each education field (used to handle form inputs)
  List<ProjectControllers> controllersList = [];

  // A list to manage the expansion state of each education field (for UI purposes)
  List<bool> expansionStates = [];

  // Register education details
  Future<void> registerProject(List<ProjectInfoModel> projectList) async {
    final token = await secureStorage.read(key: 'jwt_token');
    if (token == null) {
      throw Exception('Token not found. Please log in again.');
    }

    final Map<String, dynamic> projectData = {
      "projectList": projectList,
    };

    try {
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: projectData,
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to save education details: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Method to add a new education field
  void addProjectField() {
    final controllers = ProjectControllers(
      projectTitle: TextEditingController(),
      technologies: TextEditingController(),
      link: TextEditingController(),
      description: TextEditingController(),
    );

    controllersList.add(controllers);
    expansionStates.add(false);  // Initially, the education field will not be expanded
  }

  // Method to delete an existing education field by index
  void deleteProjectField(int index) {
    if (index >= 0 && index < controllersList.length) {
      controllersList[index].dispose();
      controllersList.removeAt(index);
      expansionStates.removeAt(index);
      _projectList.removeAt(index); // Also remove from the education list
    }
  }

  // Method to update the expansion state of an education field by index
  void updateExpansionState(int index, bool isExpanded) {
    if (index >= 0 && index < expansionStates.length) {
      expansionStates[index] = isExpanded;
    }
  }

  // Method to get the current list of education fields
  List<ProjectInfoModel> getProjectList() {
    return _projectList;
  }

  // Helper method to convert controllers to EducationModel (for easy use in UI)
  List<ProjectInfoModel> convertControllersToProjectInfoModel() {
    return controllersList.map((controllers) {
      return ProjectInfoModel(
        projectTitle: controllers.projectTitle.text ?? '',
        technologiesUsed: controllers.technologies.text ?? '',
        projectLink: controllers.link.text ?? '',
        projectDescription: controllers.description.text ?? '',
      );
    }).toList();
  }
}
