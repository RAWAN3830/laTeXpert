import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart';

class SkillCategoryWidget extends StatelessWidget {
  final String categoryName;
  final List<String> skills;
  final TextEditingController controller;

  const SkillCategoryWidget({
    required this.categoryName,
    required this.skills,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SkillsSetBlocCubit>();

    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(categoryName, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'Add a skill'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final skill = controller.text.trim();
                    if (skill.isNotEmpty) {
                      cubit.addSkill(categoryName, skill);
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
            Wrap(
              spacing: 8.0,
              children: skills.map((skill) {
                return Chip(
                  label: Text(skill),
                  onDeleted: () => cubit.removeSkill(categoryName, skill),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
