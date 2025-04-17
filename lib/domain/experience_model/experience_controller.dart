import 'package:flutter/material.dart';
import 'package:latexpert/domain/experience_model/experience_model.dart';

class ExperienceController {
  final TextEditingController employer;
  final TextEditingController jobTitle;
  final TextEditingController location;
  final TextEditingController startDate;
  final TextEditingController endDate;
  final TextEditingController description;

  ExperienceController({
    required this.employer,
    required this.jobTitle,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  void dispose() {
    employer.dispose();
    location.dispose();
    jobTitle.dispose();
    description.dispose();
    startDate.dispose();
    endDate.dispose();
  }

  // Method to get all controllers (to dispose them)
  List<TextEditingController> getControllers() {
    return [
      employer,
      location,
      jobTitle,
      description,
      startDate,
      endDate,
    ];
  }
}
extension EducationControllersExtension on ExperienceController {
  ExperienceModel toModel() {
    return ExperienceModel(
      employer: employer.text,
      location: location.text,
      jobTitle: jobTitle.text,
      description: description.text,
      startDate: startDate.text,
      endDate: endDate.text,
    );
  }
}