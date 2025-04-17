import 'package:flutter/material.dart';

import 'education_model.dart';

class EducationControllers {
  final TextEditingController institution;
  final TextEditingController location;
  final TextEditingController degreeType;
  final TextEditingController fieldOfStudy;
  final TextEditingController startDate;
  final TextEditingController endDate;

  EducationControllers({
    required this.institution,
    required this.location,
    required this.degreeType,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
  });

  // Helper method to dispose all controllers
  void dispose() {
    institution.dispose();
    location.dispose();
    degreeType.dispose();
    fieldOfStudy.dispose();
    startDate.dispose();
    endDate.dispose();
  }

  // Method to get all controllers (to dispose them)
  List<TextEditingController> getControllers() {
    return [
      institution,
      location,
      degreeType,
      fieldOfStudy,
      startDate,
      endDate,
    ];
  }
}
extension EducationControllersExtension on EducationControllers {
  EducationModel toModel() {
    return EducationModel(
      institution: institution.text,
      location: location.text,
      degreeType: degreeType.text,
      fieldOfStudy: fieldOfStudy.text,
      startDate: startDate.text,
      endDate: endDate.text,
    );
  }
}

