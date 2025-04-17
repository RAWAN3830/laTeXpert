import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/infra/bloc/project_bloc/project_bloc_cubit.dart';
import 'package:latexpert/infra/services/project_service/project_service.dart';
import '../../../core/constant/strings.dart';
import '../../../domain/project_info_model/project_controller.dart';
import '../../../infra/bloc/project_bloc/project_state.dart';
import '../../common_widgets/common_appbar/custome_appbar.dart';
import '../../common_widgets/common_buttons/common_add_field_button.dart';
import '../../common_widgets/common_buttons/common_reset_button.dart';
import '../../common_widgets/common_buttons/common_save_button.dart';
import '../../common_widgets/common_text/common_heading.dart';
import '../../common_widgets/common_textfields/comman_textformfield.dart';
import '../../common_widgets/common_textfields/common_longlinetextfield.dart';

class ProjectInfo extends StatefulWidget {
  final bool showAppBar;
  final VoidCallback? onNext;

  const ProjectInfo({super.key, this.showAppBar = true, this.onNext});

  @override
  State<ProjectInfo> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? const CustomAppBar(title: Strings.projects) : null,
      body: BlocProvider(
        create: (context) => ProjectBlocCubit(),
        child: BlocBuilder<ProjectBlocCubit, ProjectState>(
          builder: (context, state) {
            final cubit = context.read<ProjectBlocCubit>();
            final controllersList = cubit.controllersList;
            final expansionStates = cubit.expansionStates;

            return state.maybeWhen(
              success: (projectList) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controllersList.length,
                            itemBuilder: (context, index) {
                              final controller = controllersList[index];
                              final isExpanded = expansionStates[index];

                              return ExpansionTile(
                                key: Key(index.toString()),
                                initiallyExpanded: isExpanded,
                                onExpansionChanged: (expanded) {
                                  cubit.updateExpansionState(index, expanded);
                                },
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${Strings.projectTitle} ${index + 1}',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (controllersList.length > 1)
                                      IconButton(
                                        onPressed: () => cubit.deleteProjectField(index),
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                      ),
                                  ],
                                ),
                                children: [
                                  const CommonHeading(title: Strings.projectTitle),
                                  CommonTextformfield(
                                    controller: controller.projectTitle,
                                    labelText: Strings.projectTitle,
                                    errorText: Strings.enterProjectTitle,
                                  ),
                                  const CommonHeading(title: Strings.technologiesUsed),
                                  CommonTextformfield(
                                    controller: controller.technologies,
                                    labelText: 'Javascript, Firebase',
                                    errorText: Strings.enterTechnologies,
                                  ),
                                  const CommonHeading(title: Strings.projectLink),
                                  CommonTextformfield(
                                    controller: controller.link,
                                    labelText: 'github.com/your-username/repo',
                                    errorText: Strings.enterLink,
                                  ),
                                  const CommonHeading(title: Strings.projectDescription),
                                  CommonLongLineTextField(
                                    controller: controller.description,
                                    hintText: Strings.projectDescription,
                                    errorText: Strings.enterDescription,
                                  ),
                                  SizedBox(height: context.height(context) * 0.01),
                                ],
                              );
                            },
                          ),
                          CommonAddFieldButton(
                            onTap: cubit.addProjectField,
                            name: Strings.addProject,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonSaveButton(
                                formKey: formKey,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    final projectList = context
                                        .read<ProjectBlocCubit>()
                                        .controllersList
                                        .map((controllers) {
                                      return controllers.toModel(); // clean conversion
                                    }).toList();

                                    context
                                        .read<ProjectBlocCubit>()
                                        .registerProject(context, projectList);
                                  }
                                },
                                name: Strings.saveContinue,
                              ),
                              CommonResetButton(
                                formKey: formKey,
                                onTap: () {
                                  setState(() {
                                    cubit.controllersList.clear();
                                    cubit.addProjectField();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
