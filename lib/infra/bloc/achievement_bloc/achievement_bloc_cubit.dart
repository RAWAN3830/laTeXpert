import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/domain/achievement_info_model/achievement_controller.dart';
import 'package:latexpert/domain/achievement_info_model/achievement_info_model.dart';
import 'package:latexpert/infra/bloc/achievement_bloc/achievement_state.dart';
import 'package:latexpert/infra/services/achievement_service/achievemnet_service.dart';

class AchievementCubit extends Cubit<AchievementState> {
  final AchievementService _achievementService = AchievementService();

  // State starts with initial, then immediately we add the default field
  AchievementCubit() : super(const AchievementState.initial()) {
    addAchievementField();
  }

  // Add new achievement field
  void addAchievementField() {
    _achievementService.addAchievementField();
    _emitSuccessState();
  }

  // Delete achievement field
  void deleteAchievementField(int index) {
    _achievementService.deleteAchievementField(index);
    _emitSuccessState();
  }

  // Register achievements via API
  Future<void> registerAchievements(BuildContext context,List<AchievementInfoModel> achievementList) async {
    emit(const AchievementState.loading());
    try {
      await _achievementService.registerAchievements(achievementList);
      emit(AchievementState.success(achievementList: achievementList));
    } catch (e) {
      emit(AchievementState.failure(errorMessage: e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Dispose all controllers on close
  @override
  Future<void> close() {
    _achievementService.disposeControllers(_achievementService.controllersList);
    return super.close();
  }

  void _emitSuccessState() {
    // Convert controllers to projectModel before emitting success state
    final achievementList = _achievementService.convertControllersToAchievementModel();
    emit(AchievementState.success(achievementList: achievementList));
  }


  // Getters to access controller & expansion state (if needed in UI)
  List<AchievementControllers> get controllersList =>
      _achievementService.controllersList;

  List<bool> get expansionStates => _achievementService.expansionStates;
}
