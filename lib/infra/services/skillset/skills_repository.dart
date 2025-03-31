import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/infra/services/firestore_collection_service/fire_store_collection_service.dart';

class SkillsSetService {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<Map<String, List<String>>> loadSkills() async {
    final snapshot = await fireStore.collection('skills_categories').get();
    final categories = <String, List<String>>{};

    for (var doc in snapshot.docs) {
      categories[doc.id] = List<String>.from(doc.data()['skills'] ?? []);
    }

    // Initialize with defaults if Firestore is empty
    if (categories.isEmpty) {
      categories.addAll(defaultCategories);
      for (var entry in categories.entries) {
        await fireStore.collection('skills_categories').doc(entry.key).set({
          'skills': entry.value,
        });
      }
    }

    return categories;
  }

  Future<void> addSkill(String category, String skill,
      Map<String, List<String>> categories) async {
    final currentSkills = List<String>.from(categories[category] ?? []);
    if (!currentSkills.contains(skill)) {
      currentSkills.add(skill);
      await FireStoreCollectionService().fireStoreCollection(
          collection: Strings.skillSets,
          docId: 'skill',
          data: {'skills': currentSkills});
    }
  }

  Future<void> removeSkill(String category, String skill,
      Map<String, List<String>> categories) async {
    final currentSkills = List<String>.from(categories[category] ?? []);
    currentSkills.remove(skill);
    await fireStore
        .collection('skills_categories')
        .doc(category)
        .set({'skills': currentSkills});
  }

  static const defaultCategories = {
    'Programming Languages': ['Dart', 'Python'],
    'Frameworks': ['Flutter', 'Django'],
  };
}
