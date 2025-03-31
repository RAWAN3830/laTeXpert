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
//     context.read<ExperienceCubit>().initialize();
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
//                 BlocBuilder<ExperienceCubit, ExperienceState>(
//                   builder: (context, state) {
//                     if (state is ExperienceStateSuccess) {
//                       var controllersList = context.read<ExperienceCubit>().getControllersList();
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
//                                       context, index, () => context.read<ExperienceCubit>().deleteExperienceField(index)),
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
//                 BlocBuilder<ExperienceCubit, ExperienceState>(
//                   builder: (context, state) {
//                     if (state is ExperienceStateSuccess && context.read<ExperienceCubit>().getControllersList().length < 4) {
//                       return CommonAddFieldButton(
//                         onTap: () => context.read<ExperienceCubit>().addExperienceField(),
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
//                           // context.read<ExperienceCubit>().saveExperience();
//                           widget.onNext?.call();
//                         }
//                       },
//                       name: Strings.saveContinue,
//                     ),
//                     CommonResetButton(
//                       formKey: _formKey,
//                       onTap: () {
//                         setState(() {
//                           context.read<ExperienceCubit>().initialize();
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
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_popup/common_delete_popup.dart';
import 'package:latexpert/presentation/common_widgets/common_text/common_heading.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/common_years_textfield.dart';
import 'package:latexpert/presentation/common_widgets/common_appbar/custome_appbar.dart';
import '../../../infra/bloc/experiences_bloc/experiences_bloc.dart';
import '../../../infra/bloc/experiences_bloc/experiences_state.dart';
import '../../common_widgets/common_buttons/common_reset_button.dart';

class ExperienceScreen extends StatefulWidget {
  final bool showAppBar;
  final VoidCallback? onNext;

  const ExperienceScreen({Key? key, this.showAppBar = true, this.onNext}) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final _formKey = GlobalKey<FormState>();
  final Dio dio = Dio();
  final String baseUrl = "${Strings.baseUrl}experience_info"; // Replace with your backend URL
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    context.read<ExperienceCubit>().initialize();
  }

  Future<void> registerExperience() async {
    if (!_formKey.currentState!.validate()) return;

    // Assuming you have a method to get the JWT token
    final token = await getToken();
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Token not found. Please log in again.')),
      );
      return;
    }

    final controllersList = context.read<ExperienceCubit>().getControllersList();

    List<Map<String, dynamic>> experienceList = controllersList.map((controller) {
      return {
        "employer": controller.employer.text,
        "jobTitle": controller.jobTitle.text,
        "location": controller.location.text,
        "startDate": controller.startDate.text,
        "endDate": controller.endDate.text,
        "description": controller.description.text,
      };
    }).toList();

    final Map<String, dynamic> experienceData = {
      "experienceList": experienceList,
    };

    try {
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: experienceData,
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Experience details saved successfully.')),
        );
        widget.onNext?.call();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save experience details: ${response.data}')),
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
    return  secureStorage.read(key: 'jwt_token'); // Replace with the actual token retrieval logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? const CustomAppBar(title: Strings.experience) : null,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                BlocBuilder<ExperienceCubit, ExperienceState>(
                  builder: (context, state) {
                    if (state is ExperienceStateSuccess) {
                      var controllersList = context.read<ExperienceCubit>().getControllersList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controllersList.length,
                        itemBuilder: (context, index) {
                          var controllers = controllersList[index];
                          return ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controllers.employer.text.isEmpty
                                      ? '${Strings.experienceDetails} ${index + 1}'
                                      : controllers.employer.text,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => CommonDeletePopup().showDeleteConfirmationDialog(
                                      context, index, () => context.read<ExperienceCubit>().deleteExperienceField(index)),
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
                BlocBuilder<ExperienceCubit, ExperienceState>(
                  builder: (context, state) {
                    if (state is ExperienceStateSuccess && context.read<ExperienceCubit>().getControllersList().length < 4) {
                      return CommonAddFieldButton(
                        onTap: () => context.read<ExperienceCubit>().addExperienceField(),
                        name: Strings.addExperience,
                      );
                    }
                    return Container();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommonSaveButton(
                      formKey: _formKey,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          registerExperience();
                        }
                      },
                      name: Strings.saveContinue,
                    ),
                    CommonResetButton(
                      formKey: _formKey,
                      onTap: () {
                        setState(() {
                          context.read<ExperienceCubit>().initialize();
                        });
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