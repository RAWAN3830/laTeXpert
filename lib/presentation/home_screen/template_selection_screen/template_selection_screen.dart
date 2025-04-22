import 'package:flutter/material.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/presentation/common_widgets/common_appbar/custome_appbar.dart';

class TemplateSelectionScreen extends StatelessWidget {
  const TemplateSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> templateList = [
      'assets/template/template(1).jpeg',
      'assets/template/template(2).jpeg',
      'assets/template/template(3).jpeg'
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Template Selection'),
      body: GridView.builder(
          shrinkWrap: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: templateList.length,
          itemBuilder: (context, index) => Image.asset(
                templateList[index],
                width: context.height(context) * 0.3,
              )),
    );
  }
}
