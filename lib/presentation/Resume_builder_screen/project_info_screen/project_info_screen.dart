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
  _ProjectInfoState createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String baseUrl = "${Strings.baseUrl}project_info";
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final List<ProjectControllers> _allControllers = [
    ProjectControllers(
        project_title: TextEditingController(),
        technologies: TextEditingController(),
        link: TextEditingController(),
        description: TextEditingController())
  ];

  void _addField() {
    setState(() {
      _allControllers.add(ProjectControllers(
          project_title: TextEditingController(),
          technologies: TextEditingController(),
          link: TextEditingController(),
          description: TextEditingController()));
    });
  }

  Future<void> registerProjectInfo() async {
    if (!formKey.currentState!.validate()) return;

    final token = await getToken();
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Token not found. Please log in again.')),
      );
      return;
    }

    List<Map<String, dynamic>> projectList = _allControllers.map((controller) {
      return {
        "projectTitle": controller.project_title.text,
        "technologiesUsed": controller.technologies.text,
        "projectLink": controller.link.text,
        "projectDescription": controller.description.text,
      };
    }).toList();

    final Map<String, dynamic> projectData = {
      "projectList": projectList,
    };

    try {
      final response = await Dio().post(
        baseUrl, // Replace with your actual endpoint
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: projectData,
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Project details saved successfully.')),
        );
        widget.onNext?.call();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save project details: ${response.data}')),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<String?> getToken() async {
    // Implement your method to get the JWT token
    return secureStorage.read(key: 'jwt_token'); // Replace with the actual token retrieval logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? const CustomAppBar(title: Strings.projects,) : null,
      body: BlocProvider(
        create: (context) => ProjectCubit(ProjectService()),
        child: BlocBuilder<ProjectCubit, ProjectState>(
          builder: (context, state) {
            final cubit = context.read<ProjectCubit>();

            return state.maybeWhen(
              success: (projectData, expandedIndex) {
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
                            itemCount: _allControllers.length,
                            itemBuilder: (context, index) {
                              final allcontroller = _allControllers[index];

                              return ExpansionTile(
                                key: Key(index.toString()),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${Strings.projectTitle} ${index + 1}',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (projectData.projectMasterModel.length > 1)
                                      IconButton(
                                        onPressed: () => cubit.removeProjectFieldSet(index),
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                      ),
                                  ],
                                ),
                                initiallyExpanded: expandedIndex == index,
                                onExpansionChanged: (isExpanded) {
                                  cubit.toggleExpansion(index, isExpanded);
                                },
                                children: [
                                  const CommonHeading(title: Strings.projectTitle),
                                  CommonTextformfield(
                                    controller: allcontroller.project_title,
                                    labelText: Strings.projectTitle,
                                    errorText: Strings.enterProjectTitle,
                                  ),
                                  const CommonHeading(title: Strings.technologiesUsed),
                                  CommonTextformfield(
                                    controller: allcontroller.technologies,
                                    labelText: 'Javascript, Firebase',
                                    errorText: Strings.enterTechnologies,
                                  ),
                                  const CommonHeading(title: Strings.projectLink),
                                  CommonTextformfield(
                                    controller: allcontroller.link,
                                    labelText: 'github.com/your-username/repo',
                                    errorText: Strings.enterLink,
                                  ),
                                  const CommonHeading(title: Strings.projectDescription),
                                  CommonLongLineTextField(
                                    controller: allcontroller.description,
                                    hintText: Strings.projectDescription,
                                    errorText: Strings.enterDescription,
                                  ),
                                  SizedBox(height: context.height(context) * 0.01),
                                ],
                              );
                            },
                          ),
                          CommonAddFieldButton(
                            onTap: _addField,
                            name: Strings.addProject,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonSaveButton(
                                formKey: formKey,
                                onTap: registerProjectInfo,
                                name: Strings.saveContinue,
                              ),
                              CommonResetButton(
                                formKey: formKey,
                                onTap: () {
                                  setState(() {
                                    _allControllers.clear();
                                    _addField();
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
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}