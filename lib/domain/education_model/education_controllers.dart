import 'package:flutter/cupertino.dart';

class EducationControllers{
  final TextEditingController institution;
  final TextEditingController location;
  final TextEditingController degreeType;
  final TextEditingController fieldOfStudy;
  final TextEditingController startDate;
  final TextEditingController endDate;


  EducationControllers({ required this.degreeType,required this.fieldOfStudy,required this.startDate,required this.endDate, required this.institution, required this.location});
}