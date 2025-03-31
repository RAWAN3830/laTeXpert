import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import '../../../infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart';
import 'skills_set_widget/skill_category_list.dart';
import '../../common_widgets/common_appbar/custome_appbar.dart';
import 'package:latexpert/core/constant/strings.dart';

class SkillsScreen extends StatelessWidget {
  final bool showAppBar;
  final VoidCallback? onNext;

  const SkillsScreen({super.key, this.showAppBar = true, this.onNext});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SkillsSetBlocCubit(),
      child: SkillsView(showAppBar: showAppBar,onNext: onNext,),
    );
  }
}

class SkillsView extends StatelessWidget {
  final bool showAppBar;
  final VoidCallback? onNext;
  final formKey = GlobalKey<FormState>();

   SkillsView({super.key, required this.showAppBar, this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? const CustomAppBar(title: Strings.skillSets) : null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(child: SkillCategoryList()),
            CommonSaveButton(formKey: formKey, onTap:()=>onNext?.call(),name: Strings.saveContinue)
          ],
        ),
      ),
    );
  }
}