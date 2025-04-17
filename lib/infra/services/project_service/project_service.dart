import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/domain/project_info_model/project_controller.dart';
import 'package:latexpert/domain/project_info_model/project_info_model.dart';

class ProjectService {
  final Dio dio = Dio();
  final String baseUrl = "${Strings.baseUrl}project_info";  // Change this URL as needed

  final List<ProjectInfoModel> _projectList = [];

  // A list of controllers for each project field (used to handle form inputs)
  List<ProjectControllers> controllersList = [];

  // A list to manage the expansion state of each project field (for UI purposes)
  List<bool> expansionStates = [];

  // Register project details
  Future<void> registerProject(List<ProjectInfoModel> projectList) async {
    final token = await Strings.secureStorage.read(key: 'jwt_token');
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
        throw Exception('Failed to save project details: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Method to add a new project field
  void addProjectField() {
    final controllers = ProjectControllers(
      projectTitle: TextEditingController(),
      technologies: TextEditingController(),
      link: TextEditingController(),
      description: TextEditingController(),
    );

    controllersList.add(controllers);
    expansionStates.add(false);  // Initially, the project field will not be expanded
  }

  // Method to delete an existing project field by index
  void deleteProjectField(int index) {
    if (index >= 0 && index < controllersList.length) {
      controllersList[index].dispose();
      controllersList.removeAt(index);
      expansionStates.removeAt(index);
      _projectList.removeAt(index); // Also remove from the project list
    }
  }

  // Method to update the expansion state of an project field by index
  void updateExpansionState(int index, bool isExpanded) {
    if (index >= 0 && index < expansionStates.length) {
      expansionStates[index] = isExpanded;
    }
  }

  // Method to get the current list of project fields
  List<ProjectInfoModel> getProjectList() {
    return _projectList;
  }

  // Helper method to convert controllers to projectModel (for easy use in UI)
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
