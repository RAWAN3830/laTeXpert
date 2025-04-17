import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';

class ResumePreviewScreen extends StatelessWidget {
  final TemplateData data;

  const ResumePreviewScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Preview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:FlutterResumeTemplate(

            data: data,
            imageHeight: 100,
            imageWidth: 100,
            emailPlaceHolder: 'Email:',
            telPlaceHolder: 'No:',
            experiencePlaceHolder: 'Past',
            educationPlaceHolder: 'School',
            languagePlaceHolder: 'Skills',
            aboutMePlaceholder: 'Me',
            hobbiesPlaceholder: 'Past Times',
            mode: TemplateMode.shakeEditAndSaveMode,
            showButtons: true,
            imageBoxFit: BoxFit.fitHeight,
            enableDivider: false,

            backgroundColorLeftSection: Colors.amber,
            templateTheme: TemplateTheme.technical),
      ),
    );
  }
}