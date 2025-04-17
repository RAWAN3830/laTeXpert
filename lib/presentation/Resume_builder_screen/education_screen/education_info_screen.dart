import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/infra/bloc/education_bloc/education_bloc_cubit.dart';
import 'package:latexpert/infra/bloc/education_bloc/education_state.dart';
import 'package:latexpert/presentation/common_widgets/common_appbar/custome_appbar.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_text/common_heading.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/common_years_textfield.dart';
import '../../../domain/education_model/education_controllers.dart';

class EducationInfoScreen extends StatefulWidget {
  final bool showAppBar;
  final VoidCallback? onNext;

  const EducationInfoScreen({super.key, this.showAppBar = true, this.onNext});

  @override
  _EducationInfoScreenState createState() => _EducationInfoScreenState();
}

class _EducationInfoScreenState extends State<EducationInfoScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final Dio dio = Dio();
  final String baseUrl = "${Strings.baseUrl}education_info";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EducationCubit(),
      child: Scaffold(
        appBar: widget.showAppBar
            ? const CustomAppBar(title: Strings.education)
            : null,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: BlocBuilder<EducationCubit, EducationState>(
              builder: (context, state) {
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      state.maybeWhen(
                        inProgress: () {
                          return const Center(child: CircularProgressIndicator());
                        },
                        success: (educationList) {
                          var controllersList = context.read<EducationCubit>().controllersList;

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: educationList.length,
                            itemBuilder: (context, index) {
                              var controllers = controllersList[index];

                              return ExpansionTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controllers.institution.text.isEmpty
                                          ? '${Strings.educationDetails} ${index + 1}'
                                          : controllers.institution.text,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.read<EducationCubit>().deleteEducationField(index);
                                      },
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                    ),
                                  ],
                                ),
                                children: [
                                  CommonHeading(
                                      title: '${Strings.institutionLabel} (${index + 1})'),
                                  CommonTextformfield(
                                    controller: controllers.institution,
                                    labelText: 'xyz University',
                                    errorText: Strings.institutionError,
                                  ),
                                  CommonHeading(
                                      title: '${Strings.locationLabel} (${index + 1})'),
                                  CommonTextformfield(
                                    controller: controllers.location,
                                    labelText: 'Gujarat, India',
                                    errorText: Strings.locationError,
                                  ),
                                  CommonHeading(
                                      title: '${Strings.degreeTypeLabel} (${index + 1})'),
                                  CommonTextformfield(
                                    controller: controllers.degreeType,
                                    labelText: 'Bachelors/Master',
                                    errorText: Strings.degreeTypeError,
                                  ),
                                  CommonHeading(
                                      title: '${Strings.fieldOfStudyLabel} (${index + 1})'),
                                  CommonTextformfield(
                                    controller: controllers.fieldOfStudy,
                                    labelText: 'Computer Science',
                                    errorText: Strings.fieldOfStudyError,
                                  ),
                                  CommonYearsTextField(
                                    startDateController: controllers.startDate,
                                    endDateController: controllers.endDate,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        failure: (errorMessage) {
                          return Center(child: Text('Error: $errorMessage'));
                        },
                        orElse: () {
                          return const SizedBox(); // Default case
                        },
                      ),
                      SizedBox(height: context.height(context) * 0.02),
                      CommonAddFieldButton(
                        onTap: () {
                          context.read<EducationCubit>().addEducationField();
                        },
                        name: Strings.addEducation,
                      ),
                      SizedBox(height: context.height(context) * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CommonSaveButton(
                            formKey: formKey,
                            onTap: () {
                                if (formKey.currentState!.validate()) {
                                  final educationList = context.read<EducationCubit>().controllersList.map((controllers) {
                                    return controllers.toModel(); // clean conversion
                                  }).toList();

                                  context.read<EducationCubit>().registerEducation(context, educationList);
                                }

                            },
                            name: Strings.saveContinue,
                          ),
                          CommonResetButton(
                            formKey: formKey,
                            onTap: () {
                              formKey.currentState!.reset();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
