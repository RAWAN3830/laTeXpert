import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latexpert/core/constant/strings.dart';

class PersonalInfoService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final List<Map<String, TextEditingController>> fieldControllers = [];

  Future<bool> registerUser({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String jobTitle,
    required String address,
    required List<Map<String, String>> links,
  }) async {
    try {
      final token = await secureStorage.read(key: 'jwt_token');
      if (token == null) {
        return false; // Return false to indicate failure
      }

      final dio = Dio();
      final response = await dio.post(
        "${Strings.baseUrl}personal_info",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: {
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'phone': phone,
          'jobTitle': jobTitle,
          'address': address,
          'links': links,
        },
      );

      return response.statusCode == 201; // Return true if the registration was successful
    } catch (e) {
      return false; // Return false if there was an error
    }
  }

  // Adds new fields to the list
  void addFields() {
    fieldControllers.add({
      'link': TextEditingController(),
      'name': TextEditingController(),
    });
  }

  // Removes fields from the list based on index
  void removeFields(int index) {
    if (index >= 0 && index < fieldControllers.length) {
      fieldControllers.removeAt(index);
    }
  }

  // Returns the field controllers list
  List<Map<String, TextEditingController>> getFieldControllers() {
    return fieldControllers;
  }
}
