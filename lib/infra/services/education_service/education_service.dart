import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import '../../../domain/education_model/education_model.dart';

class EducationService {
  final List<Map<String, TextEditingController>> controllersList = [
    {
      'institution': TextEditingController(),
      'location': TextEditingController(),
      'degreeType': TextEditingController(),
      'fieldOfStudy': TextEditingController(),
      'startDate': TextEditingController(),
      'endDate': TextEditingController(),
    }
  ];

  final List<bool> expansionStates = [false];

  void addEducationField() {
    controllersList.add({
      'institution': TextEditingController(),
      'location': TextEditingController(),
      'degreeType': TextEditingController(),
      'fieldOfStudy': TextEditingController(),
      'startDate': TextEditingController(),
      'endDate': TextEditingController(),
    });
    expansionStates.add(false);
  }

  void deleteEducationField(int index) {
    controllersList.removeAt(index);
    expansionStates.removeAt(index);
  }

  void updateExpansionState(int index, bool isExpanded) {
    expansionStates[index] = isExpanded;
  }

  List<EducationModel> getEducationList() {
    return controllersList.map((map) {
      return EducationModel(
        institution: map['institution']!.text,
        location: map['location']!.text,
        degreeType: map['degreeType']!.text,
        fieldOfStudy: map['fieldOfStudy']!.text,
        startDate: map['startDate']!.text,
        endDate: map['endDate']!.text,
      );
    }).toList();
  }

  Future<void> registerEducation() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final Dio dio = Dio();
    const String baseUrl = "https://latexpert.in/api/education_info";

    final token = await secureStorage.read(key: 'jwt_token');
    if (token == null) throw Exception("Token not found");

    final educationList = getEducationList()
        .map((e) => {
      "institution": e.institution,
      "location": e.location,
      "degreeType": e.degreeType,
      "fieldOfStudy": e.fieldOfStudy,
      "startDate": e.startDate,
      "endDate": e.endDate,
    })
        .toList();

    final data = {"educationList": educationList};

    final response = await dio.post(
      baseUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: data,
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to register education: ${response.data}");
    }
  }
}
