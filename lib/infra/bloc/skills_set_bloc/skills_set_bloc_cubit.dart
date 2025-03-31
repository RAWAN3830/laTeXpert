// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../services/skillset/skills_repository.dart';
// import 'skills_set_state.dart';
//
// class SkillsSetBlocCubit extends Cubit<SkillsSetState> {
//   final SkillsSetService _skillsSetService = SkillsSetService();
//
//   SkillsSetBlocCubit() : super(const SkillsSetState.initial()) {
//     loadSkills();
//   }
//
//   Future<void> loadSkills() async {
//     emit(const SkillsSetState.loading());
//     try {
//       final categories = await _skillsSetService.loadSkills();
//       emit(SkillsSetState.success(
//         categories: categories,
//         selectedCategories: categories.keys.first,
//       ));
//     } catch (e) {
//       emit(SkillsSetState.failure(errorMessage: e.toString()));
//     }
//   }
//
//   Future<void> addSkill(String category, String skill) async {
//     if (state is SkillsSetStateSuccess) {
//       final currentState = state as SkillsSetStateSuccess;
//       try {
//         await _skillsSetService.addSkill(category, skill, currentState.categories);
//
//         final updatedCategories = Map<String, List<String>>.from(currentState.categories);
//         updatedCategories[category]?.add(skill);
//
//         emit(SkillsSetState.success(
//           categories: updatedCategories,
//           selectedCategories: currentState.selectedCategories,
//         ));
//       } catch (e) {
//         emit(SkillsSetState.failure(errorMessage: e.toString()));
//       }
//     }
//   }
//
//   Future<void> removeSkill(String category, String skill) async {
//     if (state is SkillsSetStateSuccess) {
//       final currentState = state as SkillsSetStateSuccess;
//       try {
//         await _skillsSetService.removeSkill(category, skill, currentState.categories);
//
//         final updatedCategories = Map<String, List<String>>.from(currentState.categories);
//         updatedCategories[category]?.remove(skill);
//
//         emit(SkillsSetState.success(
//           categories: updatedCategories,
//           selectedCategories: currentState.selectedCategories,
//         ));
//       } catch (e) {
//         emit(SkillsSetState.failure(errorMessage: e.toString()));
//       }
//     }
//   }
//
//   void changeCategory(String category) {
//     if (state is SkillsSetStateSuccess) {
//       final currentState = state as SkillsSetStateSuccess;
//       emit(SkillsSetState.success(
//         categories: currentState.categories,
//         selectedCategories: category,
//       ));
//     }
//   }
// }
import 'package:bloc/bloc.dart';
import '../../services/skillset/skills_repository.dart';
import 'skills_set_state.dart';

class SkillsSetBlocCubit extends Cubit<SkillsSetState> {
  final SkillsSetService _skillsSetService = SkillsSetService();

  SkillsSetBlocCubit() : super(const SkillsSetState.initial()) {
    loadSkills();
  }

  Future<void> loadSkills() async {
    emit(const SkillsSetState.loading());
    try {
      final categories = await _skillsSetService.loadSkills();
      emit(SkillsSetState.success(
        categories: categories,
        selectedCategories: categories.keys.first,
      ));
    } catch (e) {
      emit(SkillsSetState.failure(errorMessage: e.toString()));
    }
  }

  Future<void> addSkill(String category, String skill) async {
    if (state is SkillsSetStateSuccess) {
      final currentState = state as SkillsSetStateSuccess;
      try {
        await _skillsSetService.addSkill(category, skill, currentState.categories);

        final updatedCategories = Map<String, List<String>>.from(currentState.categories);
        updatedCategories[category]?.add(skill);

        emit(SkillsSetState.success(
          categories: updatedCategories,
          selectedCategories: currentState.selectedCategories,
        ));
      } catch (e) {
        emit(SkillsSetState.failure(errorMessage: e.toString()));
      }
    }
  }

  Future<void> removeSkill(String category, String skill) async {
    if (state is SkillsSetStateSuccess) {
      final currentState = state as SkillsSetStateSuccess;
      try {
        await _skillsSetService.removeSkill(category, skill, currentState.categories);

        final updatedCategories = Map<String, List<String>>.from(currentState.categories);
        updatedCategories[category]?.remove(skill);

        emit(SkillsSetState.success(
          categories: updatedCategories,
          selectedCategories: currentState.selectedCategories,
        ));
      } catch (e) {
        emit(SkillsSetState.failure(errorMessage: e.toString()));
      }
    }
  }

  void changeCategory(String category) {
    if (state is SkillsSetStateSuccess) {
      final currentState = state as SkillsSetStateSuccess;
      emit(SkillsSetState.success(
        categories: currentState.categories,
        selectedCategories: currentState.selectedCategories,
      ));
    }
  }
}