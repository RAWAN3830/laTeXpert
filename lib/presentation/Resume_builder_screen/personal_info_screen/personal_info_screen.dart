// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resume/core/constant/extension.dart';
// import 'package:resume/core/constant/strings.dart';
// import 'package:resume/domain/personal_info_model/personal_info_model.dart';
// import 'package:resume/infra/bloc/personal_info_bloc/personal_info_bloc_cubit.dart';
// import 'package:resume/infra/bloc/personal_info_bloc/personal_info_state.dart';
// import 'package:resume/presentation/common_widgets/common_appbar/custome_appbar.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_add_field_button.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
// import 'package:resume/presentation/common_widgets/common_erro_success_message/common_error_success_message.dart';
// import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// String? firstname;
// String? lastname;
// String? email;
// String? phone;
// String? jobTitle;
// String? address;
//
// class PersonalInfo extends StatefulWidget {
//   final bool showAppBar;
//   final VoidCallback? onNext;
//   const PersonalInfo({super.key, this.showAppBar = true, this.onNext});
//
//   @override
//   State<PersonalInfo> createState() => _PersonalInfoState();
// }
//
// int indexCount = 0;
//
// TextEditingController firstNameController = TextEditingController();
// TextEditingController lastNameController = TextEditingController();
// TextEditingController emailController = TextEditingController();
// TextEditingController phoneController = TextEditingController();
// TextEditingController jobTitleController = TextEditingController();
// TextEditingController addressController = TextEditingController();
// final formKey = GlobalKey<FormState>();
// List<Map<String, TextEditingController>> fieldControllers = [];
// // const String baseUrl = "http://192.168.113.67:8000/api/personal-info";
// // const String baseUrl = "http://192.168.113.67:8000/api/auth/add_personal_info";
// const String baseUrl = "http://192.168.1.15:8000/api/personal-info";
//
//
// class _PersonalInfoState extends State<PersonalInfo> {
//   final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
//
//   Future<void> registerUser() async {
//     final String firstname = firstNameController.text;
//     final String lastname = lastNameController.text;
//     final String email = emailController.text;
//     final String phone = phoneController.text;
//     final String jobTitle = jobTitleController.text;
//     final String address = addressController.text;
//
//     if (firstname.isEmpty || lastname.isEmpty || email.isEmpty || phone.isEmpty || jobTitle.isEmpty || address.isEmpty) {
//       CommonMessage.showError(context, 'All fields are required');
//       return;
//     }
//
//     List<Links> links = fieldControllers.map((field) {
//       return Links(name: field['name']?.text ?? '', link: field['link']?.text ?? '');
//     }).toList();
//
//
//     BlocProvider.of<PersonalInfoCubit>(context).addPersonalInfo(PersonalInfoModel(firstname: firstname, lastname: lastname, email: email, phone: phone, jobTitle: jobTitle, address: address, links: links,), context);
//
//     try {
//       final token = await secureStorage.read(key: 'jwt_token');
//       if (token == null) {
//         CommonMessage.showError(context, 'Token not found. Please log in again.');
//         return;
//       }
//
//       final dio = Dio();
//       final response = await dio.post(
//         baseUrl,
//         options: Options(headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token', // Add token here
//         }),
//         data: {
//           'firstname': firstname,
//           'lastname': lastname,
//           'email': email,
//           'phone': phone,
//           'jobTitle': jobTitle,
//           'address': address,
//           'links': links,
//         },
//       );
//
//       if (response.statusCode == 201) {
//         CommonMessage.showSuccess(context, 'User registered successfully');
//       } else {
//         CommonMessage.showError(context, 'Failed to register user: ${response.data}');
//       }
//     } catch (e) {
//       CommonMessage.showError(context, 'Error: $e');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     if (firstname != null &&
//         lastname != null &&
//         email != null &&
//         phone != null &&
//         jobTitle != null &&
//         address != null) {
//       firstNameController.text = firstname ?? '';
//       lastNameController.text = lastname ?? '';
//       emailController.text = email ?? '';
//       phoneController.text = phone ?? '';
//       jobTitleController.text = jobTitle ?? '';
//       addressController.text = address ?? '';
//     }
//   }
//
//   void addFields() {
//     setState(() {
//       fieldControllers.add({
//         'link': TextEditingController(),
//         'name': TextEditingController(),
//       });
//     });
//   }
//
//   void removeFields(int index) {
//     setState(() {
//       fieldControllers.removeAt(index);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height * 0.01;
//     var width = MediaQuery.of(context).size.width;
//
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         appBar: widget.showAppBar
//             ? const CustomAppBar(
//           title: Strings.contactInfo,
//         )
//             : null,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0).copyWith(top: 0),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const CommonHeading(title: Strings.firstName),
//                                 CommonTextformfield(
//                                   labelText: Strings.firstName,
//                                   controller: firstNameController,
//                                   errorText: Strings.enterValidName,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(width: width * 0.05),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const CommonHeading(title: Strings.lastName),
//                                 CommonTextformfield(
//                                   labelText: Strings.lastName,
//                                   controller: lastNameController,
//                                   errorText: Strings.enterValidName,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const CommonHeading(title: Strings.email),
//                       CommonTextformfield(
//                         labelText: Strings.email,
//                         controller: emailController,
//                         errorText: Strings.enterValidMail,
//                       ),
//                       const CommonHeading(title: Strings.phone),
//                       CommonTextformfield(
//                         labelText: Strings.phone,
//                         controller: phoneController,
//                         errorText: Strings.enterPhoneNo,
//                       ),
//                       const CommonHeading(title: Strings.jobTitle),
//                       CommonTextformfield(
//                         labelText: 'Full Stack Developer',
//                         controller: jobTitleController,
//                         errorText: Strings.jobTitleLabel,
//                       ),
//                       const CommonHeading(title: Strings.address),
//                       CommonLongLineTextField(
//                           controller: addressController,
//                           hintText: Strings.address,
//                           errorText: Strings.enterAddress),
//                       const CommonHeading(title: Strings.links),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         // Allows ListView to be rendered inside a scrollable parent
//                         physics: const NeverScrollableScrollPhysics(),
//                         // Prevents ListView from scrolling separately
//                         itemCount: fieldControllers.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Link ${index + 1}',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleMedium
//                                           ?.copyWith(
//                                           fontWeight: FontWeight.bold)),
//                                   IconButton(
//                                     icon: const Icon(Icons.delete,
//                                         color: Colors.red),
//                                     onPressed: () => removeFields(index),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: CommonTextformfield(
//                                       labelText: Strings.link,
//                                       controller: fieldControllers[index]
//                                       ['link'] as TextEditingController,
//                                       errorText: Strings.enterValidLink,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       width: context.width(context) * 0.03),
//                                   Expanded(
//                                     child: CommonTextformfield(
//                                       labelText: Strings.linkName,
//                                       controller: fieldControllers[index]
//                                       ['name'] as TextEditingController,
//                                       errorText: Strings.enterValidName,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                       SizedBox(
//                         height: height,
//                       ),
//                       CommonAddFieldButton(
//                         onTap: addFields,
//                         name: Strings.addField,
//                       ),
//                       SizedBox(height: height),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
//                             listener: (context, state) {
//                               state.when(
//                                 initial: () {},
//                                 inProgress: () {
//                                  return CircularProgressIndicator();
//                                 },
//                                 success: (personalInfoModel) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content:
//                                         Text(Strings.personalInfoSuccess)),
//                                   );
//                                 },
//                                 failure: (error) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                         content:
//                                         Text('${Strings.error}: $error')),
//                                   );
//                                 },
//                               );
//                             },
//                             builder: (context, state) {
//                               return CommonSaveButton(
//                                 formKey: formKey,
//                                 onTap: () {
//                                   registerUser();
//                                 },
//                                 name: Strings.saveContinue,
//                               );
//                             },
//                           ),
//                           CommonResetButton(
//                             formKey: formKey,
//                             onTap: () {},
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/infra/bloc/personal_info_bloc/personal_info_bloc_cubit.dart';
import 'package:latexpert/infra/bloc/personal_info_bloc/personal_info_state.dart';
import 'package:latexpert/presentation/common_widgets/common_appbar/custome_appbar.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_text/common_heading.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';

String? firstname;
String? lastname;
String? email;
String? phone;
String? jobTitle;
String? address;

class PersonalInfo extends StatefulWidget {
  final bool showAppBar;

  const PersonalInfo({super.key, this.showAppBar = true});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

int indexCount = 0;

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController jobTitleController = TextEditingController();
TextEditingController addressController = TextEditingController();
final formKey = GlobalKey<FormState>();
// const String baseUrl = "http://192.168.113.67:8000/api/personal-info";
// const String baseUrl = "http://192.168.113.67:8000/api/auth/add_personal_info";

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  void initState() {
    super.initState();
    if (firstname != null &&
        lastname != null &&
        email != null &&
        phone != null &&
        jobTitle != null &&
        address != null) {
      firstNameController.text = firstname ?? '';
      lastNameController.text = lastname ?? '';
      emailController.text = email ?? '';
      phoneController.text = phone ?? '';
      jobTitleController.text = jobTitle ?? '';
      addressController.text = address ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.01;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: widget.showAppBar
            ? const CustomAppBar(
                title: Strings.contactInfo,
              )
            : null,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0).copyWith(top: 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CommonHeading(title: Strings.firstName),
                                CommonTextformfield(
                                  labelText: Strings.firstName,
                                  controller: firstNameController,
                                  errorText: Strings.enterValidName,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width * 0.05),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CommonHeading(title: Strings.lastName),
                                CommonTextformfield(
                                  labelText: Strings.lastName,
                                  controller: lastNameController,
                                  errorText: Strings.enterValidName,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const CommonHeading(title: Strings.email),
                      CommonTextformfield(
                        labelText: Strings.email,
                        controller: emailController,
                        errorText: Strings.enterValidMail,
                      ),
                      const CommonHeading(title: Strings.phone),
                      CommonTextformfield(
                        labelText: Strings.phone,
                        controller: phoneController,
                        errorText: Strings.enterPhoneNo,
                      ),
                      const CommonHeading(title: Strings.jobTitle),
                      CommonTextformfield(
                        labelText: 'Full Stack Developer',
                        controller: jobTitleController,
                        errorText: Strings.jobTitleLabel,
                      ),
                      const CommonHeading(title: Strings.address),
                      CommonLongLineTextField(
                          controller: addressController,
                          hintText: Strings.address,
                          errorText: Strings.enterAddress),
                      const CommonHeading(title: Strings.links),
                      BlocBuilder<PersonalInfoBlocCubit, PersonalInfoState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            updated: (links) => ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: links.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Link ${index + 1}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        IconButton(
                                          icon: const Icon(Icons.delete,
                                              color: Colors.red),
                                          onPressed: () => context
                                              .read<PersonalInfoBlocCubit>()
                                              .removeLinkField(index),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CommonTextformfield(
                                            labelText: Strings.link,
                                            controller:
                                                links[index].linkController,
                                            errorText: Strings.enterValidLink,
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                context.width(context) * 0.03),
                                        Expanded(
                                          child: CommonTextformfield(
                                            labelText: Strings.linkName,
                                            controller:
                                                links[index].nameController,
                                            errorText: Strings.enterValidName,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                            orElse: () => const SizedBox(),
                          );
                        },
                      ),
                      SizedBox(
                        height: height,
                      ),
                      CommonAddFieldButton(
                        onTap: () {
                          context.read<PersonalInfoBlocCubit>().addLinkField();
                        },
                        name: Strings.addField,
                      ),
                      SizedBox(height: height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BlocConsumer<PersonalInfoBlocCubit,
                              PersonalInfoState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                success: (message) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)),
                                  );
                                },
                                failure: (error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error)),
                                  );
                                },
                                orElse: () {},
                              );
                            },
                            builder: (context, state) {
                              final cubit =
                                  context.read<PersonalInfoBlocCubit>();

                              return CommonSaveButton(
                                formKey: formKey,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.personalInfoAdd(
                                      firstname: firstNameController.text,
                                      lastname: lastNameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      jobTitle: jobTitleController.text,
                                      address: addressController.text,
                                      links: cubit.linkFields
                                          .map((field) => {
                                                'name':
                                                    field.nameController.text,
                                                'link':
                                                    field.linkController.text,
                                              })
                                          .toList(),
                                    );
                                  }
                                },
                                name: Strings.saveContinue,
                              );
                            },
                          ),
                          CommonResetButton(
                            formKey: formKey,
                            onTap: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
