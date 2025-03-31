// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:path_provider/path_provider.dart';
//
// class PdfGenerator {
//   final pw.Document pdf = pw.Document();
//
//   void createPdf() {
//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text(
//                 'Darshan Savaliya',
//                 style: pw.TextStyle(
//                   fontSize: 24,
//                   fontWeight: pw.FontWeight.bold,
//                 ),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Ahmedabad'),
//               pw.Text('savaliyadarshan95@gmail.com | 8200190723'),
//               pw.Text('LinkedIn: https://linkedin.com/in/savaliya-darshan'),
//               pw.Text('GitHub: https://github.com/Darshan6069'),
//               pw.Divider(),
//               pw.Text(
//                 'Motivated and detail-oriented Flutter and Android developer...',
//                 style: pw.TextStyle(fontSize: 12),
//               ),
//               pw.SizedBox(height: 20),
//               pw.Text('Education', style: pw.TextStyle(fontSize: 18)),
//               pw.Text(
//                 'Gujarat University - Bachelor of Computer Application\nSGPA: 6.6/10.0\nJune 2021 – Apr 2024',
//                 style: pw.TextStyle(fontSize: 12),
//               ),
//               pw.SizedBox(height: 20),
//               pw.Text('Projects', style: pw.TextStyle(fontSize: 18)),
//               pw.Bullet(
//                 text: 'SwiftBuy - E-commerce app with Firebase integration...',
//               ),
//               pw.Bullet(
//                 text: 'Bhagavad Gita App - Intuitive app with local storage...',
//               ),
//               pw.Bullet(
//                 text:
//                 'Weather App - Real-time weather updates using OpenWeather API...',
//               ),
//               pw.SizedBox(height: 20),
//               pw.Text('Technologies', style: pw.TextStyle(fontSize: 18)),
//               pw.Text(
//                 'Languages: Dart, HTML, CSS, Java, C++, C\n'
//                     'Frameworks/Libraries: Flutter\n'
//                     'Databases: SQLite, MySQL\n'
//                     'Additional Tools: Git, Firebase, Figma',
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Future<String> savePdf() async {
//     try {
//       final outputDir = await getApplicationDocumentsDirectory();
//       final outputFile = File('${outputDir.path}/darshan_cv.pdf');
//       await outputFile.writeAsBytes(await pdf.save());
//       return outputFile.path;
//     } catch (e) {
//       print("Error saving PDF: $e");
//       return '';
//     }
//   }
//
//   Future<void> printPdf() async {
//     try {
//       final bytes = await pdf.save();
//       await Printing.sharePdf(bytes: bytes, filename: 'darshan_cv.pdf');
//     } catch (e) {
//       print("Error sharing PDF: $e");
//     }
//   }
// }
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PDF Generator',
//       home: PdfHomePage(),
//     );
//   }
// }
//
// class PdfHomePage extends StatelessWidget {
// final PdfGenerator pdfGenerator = PdfGenerator();
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('PDF Generator'),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               pdfGenerator.createPdf();
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (_) => PdfPreviewPage(pdfGenerator: pdfGenerator),
//                 ),
//               );
//             },
//             child: Text('Generate & View PDF'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               pdfGenerator.createPdf();
//               pdfGenerator.printPdf();
//             },
//             child: Text('Share PDF'),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }
//
// class PdfPreviewPage extends StatelessWidget {
//   final PdfGenerator pdfGenerator;
//
//   PdfPreviewPage({required this.pdfGenerator});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Preview'),
//       ),
//       body: PdfPreview(
//         build: (format) => pdfGenerator.pdf.save(),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
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
//     return MaterialApp(
//       title: 'Resume Generator',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ResumeForm(),
//     );
//   }
// }
//
// class ResumeForm extends StatefulWidget {
//   const ResumeForm({super.key});
//
//   @override
//   ResumeFormState createState() => ResumeFormState();
// }
//
// class ResumeFormState extends State<ResumeForm> {
//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final educationController = TextEditingController();
//   final experienceController = TextEditingController();
//
//   Future<void> _generateResume() async {
//     if (_formKey.currentState!.validate()) {
//       final url = Uri.parse('http://localhost:3000/generate-resume');
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'name': nameController.text,
//           'email': emailController.text,
//           'education': educationController.text,
//           'experience': experienceController.text,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         // Handle PDF download here
//         // You might want to save it or open it using a PDF viewer
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to generate resume')),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Resume Generator'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: 'Full Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: educationController,
//                 decoration: const InputDecoration(labelText: 'Education'),
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your education';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: experienceController,
//                 decoration: const InputDecoration(labelText: 'Experience'),
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your experience';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _generateResume,
//                 child: const Text('Generate PDF'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }