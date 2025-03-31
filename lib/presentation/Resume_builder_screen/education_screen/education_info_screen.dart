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
import 'package:latexpert/infra/services/firestore_collection_service/fire_store_collection_service.dart';
import '../../../domain/education_model/education_controllers.dart';
import '../../../infra/services/education_service/education_service.dart';

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

  final List<EducationControllers> _allControllers = [
    EducationControllers(
        institution: TextEditingController(),
        location: TextEditingController(),
        degreeType: TextEditingController(),
        fieldOfStudy: TextEditingController(),
        startDate: TextEditingController(),
        endDate: TextEditingController()),
  ];

  Future<void> registerEducation() async {
    if (!formKey.currentState!.validate()) return;

    final token = await secureStorage.read(key: 'jwt_token');
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Token not found. Please log in again.')),
      );
      return;
    }


    List<Map<String, dynamic>> educationList = _allControllers.map((controller) {
      return {
        "institution": controller.institution.text,
        "location": controller.location.text,
        "degreeType": controller.degreeType.text,
        "fieldOfStudy": controller.fieldOfStudy.text,
        "startDate": controller.startDate.text,
        "endDate": controller.endDate.text,
      };
    }).toList();

    // Correct JSON format
    final Map<String, dynamic> educationData = {
      "educationList": educationList,
    };

    try {
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: educationData,
      );


      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Education details saved successfully.')),
        );
        widget.onNext?.call();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save education details: ${response.data}')),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EducationCubit(EducationService(FireStoreCollectionService())),
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _allControllers.length,
                        itemBuilder: (context, index) {
                          var controllers = _allControllers[index];
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
                                    setState(() {
                                      _allControllers.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            children: [
                              CommonHeading(
                                  title:
                                  '${Strings.institutionLabel} (${index + 1})'),
                              CommonTextformfield(
                                controller: controllers.institution,
                                labelText: 'xyz University',
                                errorText: Strings.institutionError,
                              ),
                              CommonHeading(
                                  title:
                                  '${Strings.locationLabel} (${index + 1})'),
                              CommonTextformfield(
                                controller: controllers.location,
                                labelText: 'Gujarat, India',
                                errorText: Strings.locationError,
                              ),
                              CommonHeading(
                                  title:
                                  '${Strings.degreeTypeLabel} (${index + 1})'),
                              CommonTextformfield(
                                controller: controllers.degreeType,
                                labelText: 'Bachelors/Master',
                                errorText: Strings.degreeTypeError,
                              ),
                              CommonHeading(
                                  title:
                                  '${Strings.fieldOfStudyLabel} (${index + 1})'),
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
                      ),
                      SizedBox(height: context.height(context) * 0.02),
                      CommonAddFieldButton(
                        onTap: () {
                          setState(() {
                            _allControllers.add(
                              EducationControllers(
                                  institution: TextEditingController(),
                                  location: TextEditingController(),
                                  degreeType: TextEditingController(),
                                  fieldOfStudy: TextEditingController(),
                                  startDate: TextEditingController(),
                                  endDate: TextEditingController()),
                            );
                          });
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
                                registerEducation(); // Call the registerEducation function
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