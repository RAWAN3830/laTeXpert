import 'package:flutter/material.dart';
import 'package:latexpert/domain/declaration_model/declaration_model.dart';

class DeclarationController {
  final TextEditingController declaration;

  DeclarationController({
    required this.declaration,
  });

  void dispose() {
    declaration.dispose();
    }

}

extension DeclarationControllerExtension on DeclarationController {
  DeclarationModel toModel() {
    return DeclarationModel(
      honorAwardTitle: declaration.text,
    );
  }
}
