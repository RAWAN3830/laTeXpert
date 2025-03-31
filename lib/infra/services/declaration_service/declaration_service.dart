import 'package:flutter/material.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/infra/services/firestore_collection_service/fire_store_collection_service.dart';

import '../../bloc/declaration_bloc/declaration_state.dart';

class DeclarationService {

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

  // Save declarations to Firestore
  Future<DeclarationState> saveDeclaration(List<TextEditingController> controllersList) async {
    List<String> honorAwards = controllersList.map((controller) => controller.text).toList();

    try {
      await FireStoreCollectionService().fireStoreCollection(
        collection: Strings.declaration,
        docId: 'declaration1',
        data: {'dataList': honorAwards},
      );
      return DeclarationState.success(honorAwardControllers: controllersList);
    } catch (e) {
      return DeclarationState.failure(errorMessage: e.toString());
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