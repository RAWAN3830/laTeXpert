import 'package:flutter/cupertino.dart';
import 'package:latexpert/domain/project_info_model/project_info_model.dart';

class ProjectControllers {
  final TextEditingController projectTitle;
  final TextEditingController technologies;
  final TextEditingController link;
  final TextEditingController description;

  ProjectControllers(
      {required this.projectTitle,
        required this. technologies,
        required this.link,
        required this.description});


  void dispose() {
    projectTitle.dispose();
    technologies.dispose();
    link.dispose();
    description.dispose();
  }

  // Method to get all controllers (to dispose them)
  List<TextEditingController> getControllers() {
    return [
    projectTitle,
    technologies,
    link,
    description
    ];
  }
}


extension ProjectControllersExtension on ProjectControllers {
  ProjectInfoModel toModel() {
    return ProjectInfoModel(
      projectTitle: projectTitle.text,
      technologiesUsed: technologies.text,
      projectLink: link.text,
      projectDescription: description.text,
    );
  }
}
