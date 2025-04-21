import 'package:dio/dio.dart';
import 'package:latexpert/core/constant/strings.dart';

class SkillsRepository {
  final Dio dio = Dio();
  final String baseUrl = "${Strings.baseUrl}skillset_info"; // Make sure this is correct endpoint

  // Function to register skills data
  Future<void> registerSkills(Map<String, dynamic> skillsJson) async {
    final token = await Strings.secureStorage.read(key: 'jwt_token');
    if (token == null) {
      throw Exception('Token not found. Please log in again.');
    }

    try {
      final response = await dio.post(
        baseUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: skillsJson, // Expecting {"skills_info": {...}}
      );

      if (response.statusCode != 201 && response.statusCode != 200) {
        throw Exception('Failed to save skills data: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error while registering skills: $e');
    }
  }
}
