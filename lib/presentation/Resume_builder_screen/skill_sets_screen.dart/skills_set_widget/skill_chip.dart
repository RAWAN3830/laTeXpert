import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/presentation/Resume_builder_screen/skill_sets_screen.dart/skills_set_widget/skill_category_list.dart';

import '../../../../infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart';
import '../../../common_widgets/common_appbar/custome_appbar.dart';

class SkillsScreen extends StatelessWidget {
  final bool showAppBar;

  const SkillsScreen({super.key, this.showAppBar = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SkillsSetBlocCubit(),
      child: SkillsView(showAppBar: showAppBar),
    );
  }
}

class SkillsView extends StatelessWidget {
  final bool showAppBar;

  const SkillsView({super.key, required this.showAppBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? const CustomAppBar(title: Strings.skillSets) : null,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: SkillCategoryList()),
          ],
        ),
      ),
    );
  }
}