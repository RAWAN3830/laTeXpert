// registration_service.dart
import 'package:dio/dio.dart';
import 'package:latexpert/core/constant/strings.dart';

class RegistrationService {
  final Dio dio = Dio();
  final String baseUrl = '${Strings.baseUrl}auth/register'; // Replace this with your real URL

  Future<String> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        data: {
          'user_name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );

      if (response.statusCode == 201) {
        return 'User registered successfully';
      } else {
        throw Exception('Failed to register: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
