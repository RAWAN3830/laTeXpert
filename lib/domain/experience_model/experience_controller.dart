import 'package:flutter/cupertino.dart';

class ExperienceControllers {
  final TextEditingController employer;
  final TextEditingController jobTitle;
  final TextEditingController location;
  final TextEditingController startDate;
  final TextEditingController endDate;
  final TextEditingController description;

  ExperienceControllers(
      {required this.employer,
      required this.jobTitle,
      required this.location,
      required this.startDate,
      required this.endDate,
      required this.description});
}
