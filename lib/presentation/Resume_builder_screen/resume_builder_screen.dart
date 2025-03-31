import 'package:flutter/material.dart';
import 'package:latexpert/domain/workspace_model.dart';
import 'package:latexpert/presentation/Resume_builder_screen/details_card.dart';
import '../../core/constant/strings.dart';
import '../common_widgets/common_text/common_richtext.dart';

class ResumeBuilderScreen extends StatefulWidget {
  const ResumeBuilderScreen({super.key});

  @override
  State<ResumeBuilderScreen> createState() => _ResumeBuilderScreenState();
}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  void _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate data loading
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final crossAxisCount = screenWidth < 600
        ? 2 // Mobile
        : screenWidth < 900
        ? 3 // Tablet
        : 4; // Desktop
    final crossAxisSpacing = screenWidth < 600 ? 10.0 : 15.0;
    final mainAxisSpacing = screenWidth < 600 ? 10.0 : 15.0;
    final paddingValue = screenWidth < 600 ? 8.0 : 16.0;

    return Scaffold(
      appBar: AppBar(
        title: const CommonRichText(title: Strings.homeScreenTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(paddingValue),
          child: Column(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: crossAxisSpacing,
                  mainAxisSpacing: mainAxisSpacing,
                  childAspectRatio: 0.9,
                ),
                itemCount: workSpaceModelList.length,
                itemBuilder: (context, index) {
                  return DetailsCard(
                    workModel: workSpaceModelList[index],
                    index: index,
                    isLoading: isLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
