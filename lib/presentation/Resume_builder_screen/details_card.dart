import 'package:flutter/material.dart';
import 'package:latexpert/presentation/Resume_builder_screen/personal_info_screen/personal_info_screen.dart';
import 'package:latexpert/presentation/Resume_builder_screen/project_info_screen/project_info_screen.dart';
import 'package:latexpert/presentation/Resume_builder_screen/skill_sets_screen.dart/skill_sets_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/domain/workspace_model.dart';
import '../../core/constant/theme_colors.dart';
import 'achievement_screen/achievements_info_screen.dart';
import 'declration_screen/declaration_screen.dart';
import 'education_screen/education_info_screen.dart';
import 'experiences_info_screen/experiences_info_screen.dart';

class DetailsCard extends StatelessWidget {
  final WorkSpaceModel workModel;
  final int index;
  final bool isLoading;

  const DetailsCard({
    super.key,
    required this.workModel,
    required this.index,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive values
    final cardHeight = screenWidth < 600 ? 100.0 : 200.0;
    final iconSize = screenWidth < 600 ? 80.0 : 100.0;
    final fontSize = screenWidth < 600 ? 18.0 : 20.0;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
      child: isLoading
          ? Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: cardHeight,
          width: screenWidth * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ThemeColors.white,
          ),
        ),
      )
          : GestureDetector(
        onTap: () {
          switch (index) {
            case 0:
              context.push(context, target: const PersonalInfo(showAppBar: true));
              break;
            case 1:
              context.push(context, target: const EducationInfoScreen(showAppBar: true));
              break;
            case 2:
              context.push(context, target: const ExperienceScreen(showAppBar: true));
              break;
            case 3:
              context.push(context, target: const SkillsScreen(showAppBar: true));
              break;
            case 4:
              context.push(context, target: const ProjectInfo(showAppBar: true));
              break;
            case 5:
              context.push(context, target: const AchievementInfoScreen(showAppBar: true));
              break;
            case 6:
              context.push(context, target: const DeclarationScreen(showAppBar: true));
              break;
            default:
              break;
          }
        },
        child: Container(
          height: cardHeight,
          width: screenWidth * 0.4,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(7, 7),
              ),
            ],
            borderRadius: BorderRadius.circular(5),
            color: ThemeColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (screenWidth < 600)
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Container(
                  height: iconSize,
                  width: iconSize,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: workModel.icon,
                ),
              ),
              Expanded(
                child: Text(
                  workModel.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
