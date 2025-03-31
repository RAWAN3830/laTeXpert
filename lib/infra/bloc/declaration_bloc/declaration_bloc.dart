import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/infra/bloc/declaration_bloc/declaration_state.dart';
import 'package:latexpert/infra/services/declaration_service/declaration_service.dart';

class DeclarationCubit extends Cubit<DeclarationState> {
  final DeclarationService _declarationService = DeclarationService();

  DeclarationCubit() : super(const DeclarationState.initial());

  void initialize() {
    emit(_declarationService.initialize());
  }

  void addDeclarationField() {
    state.maybeWhen(
      success: (controllersList) {
        emit(_declarationService.addDeclarationField(controllersList));
      },
      orElse: () {},
    );
  }

  void deleteDeclarationField(int index) {
    state.maybeWhen(
      success: (controllersList) {
        emit(_declarationService.deleteDeclarationField(index, controllersList));
      },
      orElse: () {},
    );
  }

  Future<void> saveDeclaration() async {
    state.maybeWhen(
      success: (controllersList) async {
        emit(const DeclarationState.loading());
        emit(await _declarationService.saveDeclaration(controllersList));
      },
      orElse: () {},
    );
  }

  void resetDeclarationFields() {
    state.maybeWhen(
      success: (controllersList) {
        emit(_declarationService.resetDeclarationFields(controllersList));
      },
      orElse: () {},
    );
  }

  @override
  Future<void> close() {
    state.maybeWhen(
      success: (controllersList) {
        _declarationService.disposeControllers(controllersList);
      },
      orElse: () {},
    );
    return super.close();
  }
}