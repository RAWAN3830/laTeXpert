import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart';
import 'package:latexpert/infra/bloc/skills_set_bloc/skills_set_state.dart';
import 'package:latexpert/infra/services/skillset/skills_repository.dart';
import 'package:latexpert/presentation/Resume_builder_screen/skill_sets_screen.dart/skills_set_widget/skill_category_tile.dart';

import '../../../core/constant/strings.dart';
import '../../common_widgets/common_appbar/custome_appbar.dart';
import '../../common_widgets/common_buttons/common_save_button.dart'; // If you have a custom save button

class SkillSetsScreen extends StatelessWidget {
  final Map<String, TextEditingController> _controllers = {
    'Databases': TextEditingController(),
    'Frameworks': TextEditingController(),
    'Programming Languages': TextEditingController(),
  };

  final bool showAppBar;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SkillSetsScreen({super.key, required this.showAppBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? const CustomAppBar(title: Strings.skillSets) : null,
      body: SafeArea(
        child: Column(
          children: [
            /// Scrollable List
            Expanded(
              child: BlocBuilder<SkillsSetBlocCubit, SkillsSetState>(
                builder: (context, state) {
                  return ListView(
                    padding: const EdgeInsets.all(12),
                    children: state.skillCategories.map((category) {
                      return SkillCategoryWidget(
                        categoryName: category.name,
                        skills: category.skills,
                        controller: _controllers[category.name]!,
                      );
                    }).toList(),
                  );
                },
              ),
            ),

            /// Save & Continue Button
            CommonSaveButton(
                formKey: _formKey,
                onTap: () async {
                  try {
                    await context.read<SkillsSetBlocCubit>().saveSkillsToServer();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Skills saved successfully!')),
                    );
                    // Navigate to next screen if needed
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to save: $e')),
                    );
                  }
                },
                name: Strings.saveContinue)
          ],
        ),
      ),
    );
  }
}
