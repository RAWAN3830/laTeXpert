import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/domain/declaration_model/declaration_controller.dart';
import 'package:latexpert/domain/declaration_model/declaration_model.dart';
import 'package:latexpert/infra/bloc/declaration_bloc/declaration_state.dart';
import 'package:latexpert/infra/services/declaration_service/declaration_service.dart';

class DeclarationBloc extends Cubit<DeclarationState> {
  final DeclarationService _declarationService = DeclarationService();

  DeclarationBloc() : super(const DeclarationState.initial()) {
    addDeclarationField();
  }

  // Add new declaration field
  void addDeclarationField() {
    _declarationService.addDeclarationField();
    _emitSuccessState();
  }

  // Delete declaration field
  void deleteDeclarationField(int index) {
    _declarationService.deleteDeclarationField(index);
    _emitSuccessState();
  }

  // Register declarations via API
  Future<void> registerDeclaration(BuildContext context,List<DeclarationModel> declarationList) async {
    emit(const DeclarationState.loading());
    try {
      await _declarationService.registerDeclaration(declarationList);
      emit(DeclarationState.success(declarationList: declarationList));
    } catch (e) {
      emit(DeclarationState.failure(errorMessage: e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      log(e.toString());
    }
  }

  // Dispose all controllers on close
  @override
  Future<void> close() {
    _declarationService.disposeControllers(_declarationService.controllersList);
    return super.close();
  }

  void _emitSuccessState() {
    // Convert controllers to projectModel before emitting success state
    final declarationList = _declarationService.convertControllersToDeclarationModel();
    emit(DeclarationState.success(declarationList: declarationList));
  }


  // Getters to access controller & expansion state (if needed in UI)
  List<DeclarationController> get controllersList =>
      _declarationService.controllersList;

  List<bool> get expansionStates => _declarationService.expansionStates;
}
