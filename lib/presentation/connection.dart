// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: UserScreen(),
//     );
//   }
// }
//
// class UserScreen extends StatefulWidget {
//   const UserScreen({super.key});
//
//   @override
//   _UserScreenState createState() => _UserScreenState();
// }
//
// class _UserScreenState extends State<UserScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//
//   // static const String uriHttp = "http://192.168.1.32:8000";
//   // final String baseUrl = "$uriHttp/api/users";
//   // final String baseFetchUrl = "$uriHttp/users";
//   // final String pdfUrl = "$uriHttp/posts";
//
//
//   final String baseUrl = "http://192.168.1.32:8000/user/api/users";
//   // final String baseFetchUrl = "http://192.168.1.32:8000/users";
//   final String pdfUrl = "http://192.168.1.32:8000/user/posts";
//
//   // final String baseUrl = "http://192.168.137.67:8000/api/users";
//   // // final String baseFetchUrl = "http://192.168.137.67:8000/users";
//   // final String pdfUrl = "http://192.168.137.67:8000/posts";
//
//   List<dynamic> users = [];
//   String? localPdfPath;
//
//   // Fetch users from the server
//   Future<void> fetchUsers() async {
//     try {
//       final response = await http.get(Uri.parse(baseUrl));
//       if (response.statusCode == 200) {
//         setState(() {
//           users = json.decode(response.body);
//         });
//       } else {
//         showError('Failed to fetch users');
//       }
//     } catch (e) {
//       showError(e.toString());
//     }
//   }
//
//   Future<void> addUser() async {
//     final String name = _nameController.text;
//     final String address = _addressController.text;
//
//     if (name.isEmpty || address.isEmpty) {
//       showError('All fields are required');
//       return;
//     }
//
//     try {
//       final response = await http.post(
//         Uri.parse(baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'user_name': name,
//           'address': address,
//         }),
//       );
//
//       if (response.statusCode == 201) {
//         final newUser = json.decode(response.body);
//         setState(() {
//           users.add(newUser);
//         });
//         _nameController.clear();
//         _addressController.clear();
//         showSuccess('User added successfully');
//       } else {
//         showError('Failed to add user: ${response.body}');
//       }
//     } catch (e) {
//       showError('Error: $e');
//     }
//   }
//
//   // Fetch the PDF and save it locally
//   Future<void> fetchPdf() async {
//     try {
//       final response = await http.get(Uri.parse(pdfUrl));
//       if (response.statusCode == 200) {
//         final dir = await getApplicationDocumentsDirectory();
//         final file = File("${dir.path}/preview.pdf");
//         await file.writeAsBytes(response.bodyBytes);
//         setState(() {
//           localPdfPath = file.path;
//         });
//       } else {
//         showError('Failed to fetch PDF');
//       }
//     } catch (e) {
//       showError('Error fetching PDF: $e');
//     }
//   }
//
//   void showError(String message) {
//     print(message);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message, style: const TextStyle(color: Colors.red))),
//     );
//   }
//
//   void showSuccess(String message) {
//     print(message);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message, style: const TextStyle(color: Colors.green))),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUsers();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Management & PDF Viewer'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 labelText: 'User Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _addressController,
//               decoration: const InputDecoration(
//                 labelText: 'Address',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: addUser,
//               child: const Text('Add User'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 await fetchPdf();
//                 if (localPdfPath != null) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PdfPreviewScreen(pdfPath: localPdfPath!),
//                     ),
//                   );
//                 }
//               },
//               child: const Text('View PDF'),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder: (context, index) {
//                   final user = users[index];
//                   return ListTile(
//                     title: Text(user['user_name'] ?? 'No Name'),
//                     subtitle: Text(user['address'] ?? 'No Address'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PdfPreviewScreen extends StatelessWidget {
//   final String pdfPath;
//
//   const PdfPreviewScreen({super.key, required this.pdfPath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF Preview'),
//       ),
//       body: PDFView(
//         filePath: pdfPath,
//       ),
//     );
//   }
// }
