import 'package:flutter/material.dart';

class DeclarationController {
  final TextEditingController honorController;

  DeclarationController({TextEditingController? honor})
      : honorController = honor ?? TextEditingController();
}
