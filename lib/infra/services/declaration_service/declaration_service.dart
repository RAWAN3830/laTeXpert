import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:latexpert/core/constant/strings.dart';
import '../../bloc/declaration_bloc/declaration_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeclarationService {

  final Dio dio = Dio();
  final String baseUrl = "${Strings.baseUrl}declaration_info";
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  DeclarationState initialize() {
    return DeclarationState.success(honorAwardControllers: [TextEditingController()]);
  }

  // Add a new declaration field
  DeclarationState addDeclarationField(List<TextEditingController> controllersList) {
    if (controllersList.length < 4) {
      final newControllersList = List<TextEditingController>.from(controllersList)
        ..add(TextEditingController());
      return DeclarationState.success(honorAwardControllers: newControllersList);
    }
    return DeclarationState.success(honorAwardControllers: controllersList);
  }

  // Delete a declaration field
  DeclarationState deleteDeclarationField(int index, List<TextEditingController> controllersList) {
    if (index >= 0 && index < controllersList.length) {
      final newControllersList = List<TextEditingController>.from(controllersList)
        ..removeAt(index);
      return DeclarationState.success(honorAwardControllers: newControllersList);
    }
    return DeclarationState.success(honorAwardControllers: controllersList);
  }

  // Save declarations to the backend via HTTP request (using Dio)
  Future<DeclarationState> saveDeclaration(List<TextEditingController> controllersList) async {
    List<String> honorAwards = controllersList.map((controller) => controller.text).toList();

    // Prepare the data in a format your backend expects
    final Map<String, dynamic> declarationData = {
      'declarationList': honorAwards,
    };

    try {
      final token = await secureStorage.read(key: 'jwt_token');
      if (token == null) {
        return const DeclarationState.failure(errorMessage: 'Token not found. Please log in again.');
      }

      // Make the POST request to your backend API
      final response = await dio.post(
        baseUrl,
        data: declarationData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        return DeclarationState.success(honorAwardControllers: controllersList);
      } else {
        return DeclarationState.failure(errorMessage: 'Failed to save declaration: ${response.data}');
      }
    } catch (e) {
      return DeclarationState.failure(errorMessage: 'Error: $e');
    }
  }

  // Reset declaration fields
  DeclarationState resetDeclarationFields(List<TextEditingController> controllersList) {
    for (var controller in controllersList) {
      controller.dispose();
    }
    final newControllersList = [TextEditingController()];
    return DeclarationState.success(honorAwardControllers: newControllersList);
  }

  // Dispose controllers
  void disposeControllers(List<TextEditingController> controllersList) {
    for (var controller in controllersList) {
      controller.dispose();
    }
  }
}
