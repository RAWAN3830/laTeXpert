// import 'package:hive_flutter/adapters.dart';
// import 'package:path_provider/path_provider.dart';
//
// import '../education_model/education_model.dart';
// import '../experience_model/experience_model.dart';
//
//
// class HiveStorage {
//   static Future<void> initHive() async {
//     final appDocumentDir = await getApplicationDocumentsDirectory();
//     await Hive.initFlutter(appDocumentDir.path);
//     Hive.registerAdapter(EducationMasterModelAdapter());
//     Hive.registerAdapter(EducationModelAdapter());
//     Hive.registerAdapter(ExperienceMasterModelAdapter());
//     Hive.registerAdapter(ExperienceModelAdapter());
//   }
//
//   static Future<void> storeEducationMasterModel(EducationMasterModel model) async {
//     var box = await Hive.openBox<EducationMasterModel>('educationMasterBox');
//     await box.put('educationMaster', model);
//   }
//
//   static Future<EducationMasterModel?> getEducationMasterModel() async {
//     var box = await Hive.openBox<EducationMasterModel>('educationMasterBox');
//     return box.get('educationMaster');
//   }
//
//   static Future<void> storeExperienceMasterModel(ExperienceMasterModel model) async {
//     var box = await Hive.openBox<ExperienceMasterModel>('experienceMasterBox');
//     await box.put('experienceMaster', model);
//   }
//
//   static Future<ExperienceMasterModel?> getExperienceMasterModel() async {
//     var box = await Hive.openBox<ExperienceMasterModel>('experienceMasterBox');
//     return box.get('experienceMaster');
//   }
// }