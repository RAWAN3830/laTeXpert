
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:latexpert/domain/declaration_model/declaration_controller.dart';
import 'package:latexpert/domain/declaration_model/declaration_model.dart';

import '../../../core/constant/strings.dart';

class DeclarationService {
  final Dio dio = Dio();
  final String baseUrl = "${Strings.baseUrl}declaration_info";

  final List<DeclarationModel> _declarationList = [];
  List<DeclarationController> controllersList = [];
  List<bool> expansionStates = [];

  // Initialize with one field
  void initialize() {
    controllersList = [
      DeclarationController(
        declaration: TextEditingController(),
      )
    ];
    expansionStates = [true];
  }

  // Register declaration details via API
  Future<void> registerDeclaration(List<DeclarationModel> declarationList) async {
    final token = await Strings.secureStorage.read(key: 'jwt_token');
    print(token);
    if (token == null) {
      throw Exception('Token not found. Please log in again.');
    }

    // Map the declarationList to a JSON-friendly format
    final Map<String, dynamic> declarationData = {
      "declaration_info": declarationList.map((e) => e.toJson()).toList(),
    };

    try {
      final response = await dio.post(
        baseUrl, // Replace with your actual API URL
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: declarationData,
      );

      // Handle successful response
      if (response.statusCode == 201) {
        print('Declaration info saved successfully');
      } else {
        throw Exception('Failed to save declaration info: ${response.data}');
      }
    } catch (e) {
      // Handle errors
      throw Exception('Error: $e');
    }
  }


  // Add new declaration field
  void addDeclarationField() {
    if (controllersList.length < 4) {
      controllersList.add(
        DeclarationController(
          declaration: TextEditingController(),
        ),
      );
      expansionStates.add(true);
    }
  }

  // Delete an declaration field
  void deleteDeclarationField(int index) {
    if (index >= 0 && index < controllersList.length) {
      controllersList[index].dispose();
      controllersList.removeAt(index);
      expansionStates.removeAt(index);
      _declarationList.removeAt(index);
    }
  }

  // Update expansion state
  void updateExpansionState(int index, bool isExpanded) {
    if (index >= 0 && index < expansionStates.length) {
      expansionStates[index] = isExpanded;
    }
  }

  // Convert controller values to model list
  List<DeclarationModel> convertControllersToDeclarationModel() {
    return controllersList.map((controller) {
      return DeclarationModel(
        honorAwardTitle: controller.declaration.text,
      );
    }).toList();
  }

  // Dispose all controllers
  void disposeControllers(List<DeclarationController> controllersList) {
    for (var controller in controllersList) {
      controller.dispose();
    }
    controllersList.clear();
    expansionStates.clear();
    _declarationList.clear();
  }
}
