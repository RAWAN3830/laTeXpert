import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/presentation/Resume_builder_screen/skill_sets_screen.dart/skill_sets_screen.dart';
import '../../domain/workspace_model.dart';
import '../Resume_builder_screen/achievement_screen/achievements_info_screen.dart';
import '../Resume_builder_screen/declration_screen/declaration_screen.dart';
import '../Resume_builder_screen/education_screen/education_info_screen.dart';
import '../Resume_builder_screen/experiences_info_screen/experiences_info_screen.dart';
import '../Resume_builder_screen/personal_info_screen/personal_info_screen.dart';
import '../Resume_builder_screen/project_info_screen/project_info_screen.dart';

class WorkSpaceStepper extends StatefulWidget {
  const WorkSpaceStepper({super.key});

  @override
  _WorkSpaceStepperState createState() => _WorkSpaceStepperState();
}

class _WorkSpaceStepperState extends State<WorkSpaceStepper> {
  int _currentStep = 0;

  // Function to move to the next step
  void _goToNextStep() {
    if (_currentStep < stepScreens.length - 1) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  // Function to move to the previous step
  void _goToPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  // Map of index to corresponding screen widget
  final Map<int, Widget Function(bool, VoidCallback)> stepScreens = {
    0: (showAppBar, nextStep) => PersonalInfo(showAppBar: showAppBar),
    1: (showAppBar, nextStep) => EducationInfoScreen(showAppBar: showAppBar, onNext: nextStep),
    2: (showAppBar, nextStep) => ExperienceScreen(showAppBar: showAppBar, onNext: nextStep),
    3: (showAppBar, nextStep) => SkillSetsScreen(showAppBar: showAppBar),
    4: (showAppBar, nextStep) => ProjectInfo(showAppBar: showAppBar, onNext: nextStep),
    5: (showAppBar, nextStep) => AchievementInfoScreen(showAppBar: showAppBar, onNext: nextStep),
    6: (showAppBar, nextStep) => DeclarationScreen(showAppBar: showAppBar, onNext: nextStep),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Space Stepper'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: EasyStepper(
              alignment: Alignment.center,
              enableStepTapping: false,
              showLoadingAnimation: false,
              activeStep: _currentStep,
              stepShape: StepShape.rRectangle,
              stepBorderRadius: 15,
              onStepReached: (index) {
                setState(() {
                  _currentStep = index;
                });
              },
              steps: workSpaceModelList.map((model) {
                int index = workSpaceModelList.indexOf(model);
                return EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: _currentStep >= index ? 1 : 0.3,
                      child: model.icon,
                    ),
                  ),
                  title: model.title,
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: stepScreens[_currentStep]?.call(false, _goToNextStep) ??
                  const Center(child: Text('Select a step')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentStep > 0 ? _goToPreviousStep : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _currentStep < stepScreens.length - 1 ? _goToNextStep : null,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
