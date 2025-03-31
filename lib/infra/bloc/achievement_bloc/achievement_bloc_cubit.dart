// achievement_cubit.dart
import 'package:bloc/bloc.dart';
import '../../services/achievement_service/achievemnet_service.dart';
import 'achievement_state.dart';

class AchievementCubit extends Cubit<AchievementState> {
  final AchievementService _achievementService;

  AchievementCubit(this._achievementService) : super(const AchievementState.initial());

  void addAchievementField() {
    state.maybeWhen(
      success: (controllersList, expansionStates) {
        final updatedControllers = _achievementService.addAchievementField(controllersList);
        final updatedExpansions = _achievementService.addExpansionState(expansionStates);
        emit(AchievementState.success(
          controllersList: updatedControllers,
          expansionStates: updatedExpansions,
        ));
      },
      orElse: () {},
    );
  }

  void deleteAchievementField(int index) {
    state.maybeWhen(
      success: (controllersList, expansionStates) {
        final updatedControllers = _achievementService.deleteAchievementField(controllersList, index);
        final updatedExpansions = _achievementService.deleteExpansionState(expansionStates, index);
        emit(AchievementState.success(
          controllersList: updatedControllers,
          expansionStates: updatedExpansions,
        ));
      },
      orElse: () {},
    );
  }

  void updateAchievementExpansionState(int index, bool isExpanded) {
    state.maybeWhen(
      success: (controllersList, expansionStates) {
        final updatedExpansions = _achievementService.updateExpansionState(expansionStates, index, isExpanded);
        emit(AchievementState.success(
          controllersList: controllersList,
          expansionStates: updatedExpansions,
        ));
      },
      orElse: () {},
    );
  }

  @override
  Future<void> close() {
    state.maybeWhen(
      success: (controllersList, _) {
        _achievementService.disposeControllers(controllersList);
      },
      orElse: () {},
    );
    return super.close();
  }
}
