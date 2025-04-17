// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resume/core/constant/strings.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_add_field_button.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
// import 'package:resume/presentation/common_widgets/common_popup/common_delete_popup.dart';
// import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/common_years_textfield.dart';
// import 'package:resume/presentation/common_widgets/common_appbar/custome_appbar.dart';
// import '../../../infra/bloc/experiences_bloc/experiences_bloc.dart';
// import '../../../infra/bloc/experiences_bloc/experiences_state.dart';
// import '../../common_widgets/common_buttons/common_reset_button.dart';
//
// class ExperienceScreen extends StatefulWidget {
//   final bool showAppBar;
//   final VoidCallback? onNext;
//
//   ExperienceScreen({Key? key, this.showAppBar = true, this.onNext}) : super(key: key);
//
//   @override
//   _ExperienceScreenState createState() => _ExperienceScreenState();
// }
//
// class _ExperienceScreenState extends State<ExperienceScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     context.read<ExperienceBlocCubit>().initialize();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: widget.showAppBar ? const CustomAppBar(title: Strings.experience) : null,
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 BlocBuilder<ExperienceBlocCubit, ExperienceState>(
//                   builder: (context, state) {
//                     if (state is ExperienceStateSuccess) {
//                       var controllersList = context.read<ExperienceBlocCubit>().getControllersList();
//
//                       return ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: controllersList.length,
//                         itemBuilder: (context, index) {
//                           var controllers = controllersList[index];
//                           return ExpansionTile(
//                             title: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   controllers.employer.text.isEmpty
//                                       ? '${Strings.experienceDetails} ${index + 1}'
//                                       : controllers.employer.text,
//                                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 IconButton(
//                                   onPressed: () => CommonDeletePopup().showDeleteConfirmationDialog(
//                                       context, index, () => context.read<ExperienceBlocCubit>().deleteExperienceField(index)),
//                                   icon: const Icon(Icons.delete, color: Colors.red),
//                                 ),
//                               ],
//                             ),
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0).copyWith(top: 0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const CommonHeading(title: Strings.employerLabel),
//                                     CommonTextformfield(
//                                       labelText: 'ex. Google',
//                                       controller: controllers.employer,
//                                       errorText: Strings.employerError,
//                                     ),
//                                     const CommonHeading(title: Strings.jobTitleLabel),
//                                     CommonTextformfield(
//                                       labelText: 'Senior Software Engineer',
//                                       controller: controllers.jobTitle,
//                                       errorText: Strings.jobTitleError,
//                                     ),
//                                     const CommonHeading(title: Strings.locationLabel),
//                                     CommonTextformfield(
//                                       labelText: 'San Francisco, USA',
//                                       controller: controllers.location,
//                                       errorText: Strings.locationError,
//                                     ),
//                                     CommonYearsTextField(
//                                       startDateController: controllers.startDate,
//                                       endDateController: controllers.endDate,
//                                     ),
//                                     const CommonHeading(title: Strings.descriptionLabel),
//                                     CommonLongLineTextField(
//                                       controller: controllers.description,
//                                       hintText: Strings.descriptionHint,
//                                       errorText: Strings.descriptionError,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     }
//                     return Container();
//                   },
//                 ),
//                 BlocBuilder<ExperienceBlocCubit, ExperienceState>(
//                   builder: (context, state) {
//                     if (state is ExperienceStateSuccess && context.read<ExperienceBlocCubit>().getControllersList().length < 4) {
//                       return CommonAddFieldButton(
//                         onTap: () => context.read<ExperienceBlocCubit>().addExperienceField(),
//                         name: Strings.addExperience,
//                       );
//                     }
//                     return Container();
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     CommonSaveButton(
//                       formKey: _formKey,
//                       onTap: () {
//                         if (_formKey.currentState!.validate()) {
//                           // context.read<ExperienceBlocCubit>().saveExperience();
//                           widget.onNext?.call();
//                         }
//                       },
//                       name: Strings.saveContinue,
//                     ),
//                     CommonResetButton(
//                       formKey: _formKey,
//                       onTap: () {
//                         setState(() {
//                           context.read<ExperienceBlocCubit>().initialize();
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/domain/experience_model/experience_controller.dart';
import 'package:latexpert/infra/bloc/experiences_bloc/experiences_bloc.dart';
import 'package:latexpert/infra/bloc/experiences_bloc/experiences_state.dart';
import 'package:latexpert/presentation/common_widgets/common_appbar/custome_appbar.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_popup/common_delete_popup.dart';
import 'package:latexpert/presentation/common_widgets/common_text/common_heading.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/common_years_textfield.dart';

class ExperienceScreen extends StatefulWidget {
  final bool showAppBar;
  final VoidCallback? onNext;

  const ExperienceScreen({Key? key, this.showAppBar = true, this.onNext})
      : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? const CustomAppBar(title: Strings.experience)
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                BlocBuilder<ExperiencesBlocCubit, ExperienceState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (experienceList) {
                        var controllersList = context
                            .read<ExperiencesBlocCubit>()
                            .controllersList;

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controllersList.length,
                          itemBuilder: (context, index) {
                            final controllers = controllersList[index];

                            return ExpansionTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controllers.employer.text.isEmpty
                                        ? '${Strings.experienceDetails} ${index + 1}'
                                        : controllers.employer.text,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      CommonDeletePopup()
                                          .showDeleteConfirmationDialog(
                                              context,
                                              index,
                                              () => context
                                                  .read<ExperiencesBlocCubit>()
                                                  .deleteExperienceField(
                                                      index));
                                    },
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                              children: [
                                const CommonHeading(title: Strings.employerLabel),
                                CommonTextformfield(
                                  labelText: 'ex. Google',
                                  controller: controllers.employer,
                                  errorText: Strings.employerError,
                                ),
                                const CommonHeading(title: Strings.jobTitleLabel),
                                CommonTextformfield(
                                  labelText: 'Senior Software Engineer',
                                  controller: controllers.jobTitle,
                                  errorText: Strings.jobTitleError,
                                ),
                                const CommonHeading(title: Strings.locationLabel),
                                CommonTextformfield(
                                  labelText: 'San Francisco, USA',
                                  controller: controllers.location,
                                  errorText: Strings.locationError,
                                ),
                                CommonYearsTextField(
                                  startDateController: controllers.startDate,
                                  endDateController: controllers.endDate,
                                ),
                                const CommonHeading(title: Strings.descriptionLabel),
                                CommonLongLineTextField(
                                  controller: controllers.description,
                                  hintText: Strings.descriptionHint,
                                  errorText: Strings.descriptionError,
                                ),
                              ],
                            );
                          },
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<ExperiencesBlocCubit, ExperienceState>(
                  builder: (context, state) {
                    var controllersList =
                        context.read<ExperiencesBlocCubit>().controllersList;

                    return controllersList.length < 4
                        ? CommonAddFieldButton(
                            onTap: () {
                              context
                                  .read<ExperiencesBlocCubit>()
                                  .addExperienceField();
                            },
                            name: Strings.addExperience,
                          )
                        : const SizedBox();
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommonSaveButton(
                      formKey: formKey,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          final educationList = context
                              .read<ExperiencesBlocCubit>()
                              .controllersList
                              .map((controllers) {
                            return controllers.toModel(); // clean conversion
                          }).toList();

                          context
                              .read<ExperiencesBlocCubit>()
                              .registerExperience(context, educationList);
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
          ),
        ),
      ),
    );
  }
}
