import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/constant/strings.dart';
import '../../../../infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart';
import '../../../../infra/bloc/skills_set_bloc/skills_set_state.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsSetBlocCubit, SkillsSetState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (categories, selectedCategories) => DropdownButtonFormField<String>(
            value: selectedCategories,
            decoration: const InputDecoration(
              labelText: Strings.selectCategoryLabel,
              border: OutlineInputBorder(),
            ),
            items: categories.keys
                .map((category) => DropdownMenuItem(
              value: category,
              child: Text(category),
            ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<SkillsSetBlocCubit>().updateSelectedCategory(value);
              }
            },
          ),
          failure: (_) => const SizedBox.shrink(),
        );
      },
    );
  }
}