import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/constant/strings.dart';
import '../../../../infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart';
import '../../../../infra/bloc/skills_set_bloc/skills_set_state.dart';
import 'category_drop_down.dart';

class SkillInputForm extends StatefulWidget {
  const SkillInputForm({super.key});

  @override
  State<SkillInputForm> createState() => _SkillInputFormState();
}

class _SkillInputFormState extends State<SkillInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _skillController = TextEditingController();

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }

  void _handleAddSkill(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<SkillsSetBlocCubit>().addSkill(
        context.read<SkillsSetBlocCubit>().state.maybeWhen(
          success: (_, selectedCategories) => selectedCategories,
          orElse: () => '',
        ),
        _skillController.text.trim(),
      );
      _skillController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SkillsSetBlocCubit, SkillsSetState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          success: (categories, selectedCategory) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(Strings.skillAdded)),
            );
          },
          failure: (errorMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${Strings.error}: $errorMessage')),
            );
          },
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            const CategoryDropdown(),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _skillController,
                      decoration: const InputDecoration(
                        labelText: Strings.addSkillLabel,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => state.maybeWhen(
                        success: (categories, selectedCategories) =>
                            _validateSkill(value, categories, selectedCategories),
                        orElse: () => null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _handleAddSkill(context),
                    child: const Text(Strings.addButtonLabel),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String? _validateSkill(String? value, Map<String, List<String>> categories, String selectedCategories) {
    if (value == null || value.trim().isEmpty) {
      return Strings.pleaseEnterSkill;
    }
    if (categories[selectedCategories]?.contains(value.trim()) ?? false) {
      return Strings.skillExists;
    }
    return null;
  }
}