import 'package:flutter/material.dart';

class ProjectService {
  static const int maxProjects = 4;

  /// Adds a new project field set if the maxProjects limit is not reached.
  bool canAddProject(int currentCount) => currentCount < maxProjects;

  /// Adds a new field set to the provided lists.
  Map<String, List<TextEditingController>> addProjectFieldSet(
      Map<String, List<TextEditingController>> controllers) {
    if (canAddProject(controllers['project']!.length)) {
      controllers['project']!.add(TextEditingController());
      controllers['role']!.add(TextEditingController());
      controllers['tech']!.add(TextEditingController());
      controllers['description']!.add(TextEditingController());
    }
    return controllers;
  }

  /// Removes a project field set by index from the provided lists.
  Map<String, List<TextEditingController>> removeProjectFieldSet(
      Map<String, List<TextEditingController>> controllers, int index) {
    controllers['project']![index].dispose();
    controllers['role']![index].dispose();
    controllers['tech']![index].dispose();
    controllers['description']![index].dispose();

    controllers['project']!.removeAt(index);
    controllers['role']!.removeAt(index);
    controllers['tech']!.removeAt(index);
    controllers['description']!.removeAt(index);

    return controllers;
  }

  /// Resets the lists and initializes them with a default project field set.
  Map<String, List<TextEditingController>> resetFields() {
    return {
      'project': [TextEditingController()],
      'role': [TextEditingController()],
      'tech': [TextEditingController()],
      'description': [TextEditingController()],
    };
  }
}
