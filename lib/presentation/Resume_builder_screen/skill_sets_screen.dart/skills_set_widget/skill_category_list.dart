import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart';
import '../../../../infra/bloc/skills_set_bloc/skills_set_state.dart';
import 'skill_category_tile.dart';

class SkillCategoryList extends StatelessWidget {
  const SkillCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsSetBlocCubit, SkillsSetState>(
      builder: (context, state) {
        if (state is SkillsSetStateSuccess) {
          return ListView.builder(
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories.keys.elementAt(index);
              final skills = state.categories[category]!;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                  child: SkillCategoryTile(
                    category: category,
                    skills: skills,
                  ),
                ),
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}