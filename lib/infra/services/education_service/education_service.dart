// // lib/infra/services/education_service.dart
// import 'package:flutter/material.dart';
// import 'package:resume/domain/education_model/education_model.dart';
// import 'package:resume/infra/services/firestore_collection_service/fire_store_collection_service.dart';
//
// class EducationService {
//   final FireStoreCollectionService _fireStoreCollectionService;
//
//   EducationService(this._fireStoreCollectionService);
//
//   final List<Map<String, TextEditingController>> _controllersList = [];
//   final List<bool> _expansionStates = [];
//
//   List<Map<String, TextEditingController>> get controllersList => _controllersList;
//
//   List<bool> get expansionStates => _expansionStates;
//
//   void addEducationField() {
//     if (_controllersList.length < 4) {
//       _controllersList.add({
//         'institution': TextEditingController(),
//         'location': TextEditingController(),
//         'degreeType': TextEditingController(),
//         'fieldOfStudy': TextEditingController(),
//         'startDate': TextEditingController(),
//         'endDate': TextEditingController(),
//       });
//       _expansionStates.add(true);
//     }
//   }
//
//   void deleteEducationField(int index) {
//     if (index >= 0 && index < _controllersList.length) {
//       final controllers = _controllersList[index];
//       for (var controller in controllers.values) {
//         controller.dispose();
//       }
//
//       _controllersList.removeAt(index);
//       _expansionStates.removeAt(index);
//     }
//   }
//
//   void updateExpansionState(int index, bool isExpanded) {
//     if (index >= 0 && index < _expansionStates.length) {
//       _expansionStates[index] = isExpanded;
//     }
//   }
//
//   DateTime? _parseDate(String? dateStr) {
//     if (dateStr == null || dateStr.isEmpty) return null;
//     try {
//       return DateTime.parse(dateStr);
//     } catch (e) {
//       return null;
//     }
//   }
//
//   Future<void> saveEducation() async {
//     final List<EducationModel> educationList = _controllersList.map((controllers) {
//       final startDate = _parseDate(controllers['startDate']?.text);
//       final endDate = _parseDate(controllers['endDate']?.text);
//
//       return EducationModel(
//         institution: controllers['institution']?.text ?? '',
//         location: controllers['location']?.text ?? '',
//         degreeType: controllers['degreeType']?.text ?? '',
//         fieldOfStudy: controllers['fieldOfStudy']?.text ?? '',
//         startDate: startDate ?? DateTime.now(),
//         endDate: endDate ?? DateTime.now(),
//       );
//     }).toList();
//
//     await _fireStoreCollectionService.fireStoreCollection(
//       collection: 'education',
//       docId: 'education1',
//       data: {
//         'dataList': educationList
//             .map((e) => {
//           ...e.toJson(),
//           'startDate': e.startDate.toIso8601String(),
//           'endDate': e.endDate.toIso8601String(),
//         })
//             .toList()
//       },
//     );
//   }
//
//   List<EducationModel> getEducationList() {
//     return _controllersList.map((controllers) {
//       final startDate = _parseDate(controllers['startDate']?.text);
//       final endDate = _parseDate(controllers['endDate']?.text);
//
//       return EducationModel(
//         institution: controllers['institution']?.text ?? '',
//         location: controllers['location']?.text ?? '',
//         degreeType: controllers['degreeType']?.text ?? '',
//         fieldOfStudy: controllers['fieldOfStudy']?.text ?? '',
//         startDate: startDate ?? DateTime.now(),
//         endDate: endDate ?? DateTime.now(),
//       );
//     }).toList();
//   }
// }

import 'package:flutter/material.dart';
import 'package:latexpert/domain/education_model/education_model.dart';
import 'package:latexpert/infra/services/firestore_collection_service/fire_store_collection_service.dart';

class EducationService {
  final FireStoreCollectionService _fireStoreCollectionService;

  EducationService(this._fireStoreCollectionService);

  final List<Map<String, TextEditingController>> _controllersList = [];
  final List<bool> _expansionStates = [];

  List<Map<String, TextEditingController>> get controllersList => _controllersList;
  List<bool> get expansionStates => _expansionStates;

  void addEducationField() {
    if (_controllersList.length < 4) {
      _controllersList.add({
        'institution': TextEditingController(),
        'location': TextEditingController(),
        'degreeType': TextEditingController(),
        'fieldOfStudy': TextEditingController(),
        'startDate': TextEditingController(),
        'endDate': TextEditingController(),
      });
      _expansionStates.add(true);
    }
  }

  void deleteEducationField(int index) {
    if (index >= 0 && index < _controllersList.length) {
      final controllers = _controllersList[index];
      for (var controller in controllers.values) {
        controller.dispose();
      }
      _controllersList.removeAt(index);
      _expansionStates.removeAt(index);
    }
  }

  void updateExpansionState(int index, bool isExpanded) {
    if (index >= 0 && index < _expansionStates.length) {
      _expansionStates[index] = isExpanded;
    }
  }

  Future<void> saveEducation() async {
    final List<EducationModel> educationList = _controllersList.map((controllers) {
      return EducationModel(
        institution: controllers['institution']?.text ?? '',
        location: controllers['location']?.text ?? '',
        degreeType: controllers['degreeType']?.text ?? '',
        fieldOfStudy: controllers['fieldOfStudy']?.text ?? '',
        startDate: controllers['startDate']?.text ?? '', // Store as String
        endDate: controllers['endDate']?.text ?? '', // Store as String
      );
    }).toList();

    final educationData = EducationMasterModel(education_info: educationList).toJson();

    await _fireStoreCollectionService.fireStoreCollection(
      collection: 'education',
      docId: 'education1',
      data: educationData,
    );
  }

  List<EducationModel> getEducationList() {
    return _controllersList.map((controllers) {
      return EducationModel(
        institution: controllers['institution']?.text ?? '',
        location: controllers['location']?.text ?? '',
        degreeType: controllers['degreeType']?.text ?? '',
        fieldOfStudy: controllers['fieldOfStudy']?.text ?? '',
        startDate: controllers['startDate']?.text ?? '', // Store as String
        endDate: controllers['endDate']?.text ?? '', // Store as String
      );
    }).toList();
  }
}
