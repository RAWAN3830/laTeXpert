import 'package:flutter/material.dart';
import 'package:latexpert/presentation/Resume_builder_screen/declration_screen/declaration_screen.dart';
import 'package:latexpert/presentation/Resume_builder_screen/personal_info_screen/personal_info_screen.dart';
import 'package:latexpert/presentation/Resume_builder_screen/project_info_screen/project_info_screen.dart';
import 'package:latexpert/presentation/Resume_builder_screen/skill_sets_screen.dart/skill_sets_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/domain/workspace_model.dart';
import '../../core/constant/theme_colors.dart';
import 'achievement_screen/achievements_info_screen.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive dimensions
    final cardWidth = screenWidth < 600 ? screenWidth * 0.42 : screenWidth * 0.22;
    final cardHeight = screenWidth < 600 ? screenHeight * 0.18 : screenHeight * 0.25;
    final iconSize = screenWidth < 600 ? cardHeight * 0.5 : cardHeight * 0.6;
    final fontSize = screenWidth < 600 ? 16.0 : 18.0;
    final padding = screenWidth < 600 ? 8.0 : 12.0;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: isLoading
          ? Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ThemeColors.white,
          ),
        ),
      )
          : GestureDetector(
        onTap: () => _navigateToScreen(context, index),
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: iconSize,
                width: iconSize,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: workModel.icon,
              ),
              SizedBox(height: padding * 0.5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Text(
                  workModel.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, int index) {
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
        context.push(context, target:  SkillSetsScreen(showAppBar: true));
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
  }
}