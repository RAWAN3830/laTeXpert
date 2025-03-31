// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// // import 'package:resume/models/personal_info.dart';
// // import 'package:resume/models/education_info.dart';
// // import 'package:resume/storage/hive_storage.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class SendDataScreen extends StatelessWidget {
//   final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
//
//   Future<void> sendData() async {
//     PersonalInfo? personalInfo = await HiveStorage.getPersonalInfo();
//     EducationInfo? educationInfo = await HiveStorage.getEducationInfo();
//
//     if (personalInfo == null || educationInfo == null) {
//       print('Data is missing');
//       return;
//     }
//
//     final token = await secureStorage.read(key: 'jwt_token');
//     if (token == null) {
//       print('Token not found. Please log in again.');
//       return;
//     }
//
//     var dio = Dio();
//     final response = await dio.post(
//       'http://192.168.1.15:8000/api/save_data',
//       options: Options(headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       }),
//       data: {
//         'personalInfo': {
//           'firstname': personalInfo.firstName,
//           'lastname': personalInfo.lastName,
//           'email': personalInfo.email,
//           'phone': personalInfo.phone,
//           'jobTitle': personalInfo.jobTitle,
//           'address': personalInfo.address,
//         },
//         'educationInfo': {
//           'institution': educationInfo.institution,
//           'degree': educationInfo.degree,
//           'fieldOfStudy': educationInfo.fieldOfStudy,
//           'startDate': educationInfo.startDate,
//           'endDate': educationInfo.endDate,
//         }
//       },
//     );
//
//     if (response.statusCode == 201) {
//       print('Data sent successfully');
//     } else {
//       print('Failed to send data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Send Data')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: sendData,
//           child: Text('Send Data to Backend'),
//         ),
//       ),
//     );
//   }
// }