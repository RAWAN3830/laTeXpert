import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dio/dio.dart';
import 'package:latexpert/core/constant/assets_svg_image.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/core/constant/theme_colors.dart';
import 'package:latexpert/infra/bloc/auth_bloc/email_auth/email_auth_bloc.dart';
import 'package:latexpert/infra/bloc/auth_bloc/email_auth/email_auth_state.dart';
import 'package:latexpert/presentation/auth_screen/login_screen.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/sign_up_button.dart';
import '../common_widgets/common_text/common_richtext.dart';
import '../common_widgets/common_textfields/comman_textformfield.dart';
import '../home_screen/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final phoneController = TextEditingController();
final formKey = GlobalKey<FormState>();
const String baseUrl = "${Strings.baseUrl}auth/register";


class _RegistrationScreenState extends State<RegistrationScreen> {
  Future<void> registerUser() async {
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String phone = phoneController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty) {
      showError('All fields are required');
      return;
    }

    try {
      final dio = Dio();
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        data: {
          'user_name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );

      if (response.statusCode == 201) {
        showSuccess('User registered successfully');
      } else {
        showError('Failed to register user: ${response.data}');
      }
    } catch (e) {
      showError('Error: $e');
    }
  }

  void showError(String message) {
    print(message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.red))),
    );
  }

  void showSuccess(String message) {
    print(message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.green))),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var varHeight = context.height(context) * 0.02;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(Strings.registrationSuccess)),
            );
            context.pushAndRemoveUntil(context, target: const HomeScreen());
          } else if (state is RegistrationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${Strings.errorPrefix} ${state.error}')),
            );
          }
        },
        builder: (context, state) {
          if (state is RegistrationLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.011,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(context.height(context) * 0.02)
                    .copyWith(top: context.height(context) * 0.010),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding:
                            EdgeInsets.all(context.height(context) * 0.015),
                        child: SvgPicture.asset(
                          AssetsSvgImage.registrationImage,
                          height: context.height(context) * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const CommonRichText(title: Strings.registration),
                    SizedBox(height: context.height(context) * 0.02),
                    CommonTextformfield(
                      controller: nameController,
                      labelText: Strings.labelTextForUserName,
                      errorText: Strings.errorTextForUserName,
                      validator: (value) {
                        final nameRegex = RegExp(Strings.nameRegex);
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        } else if (!nameRegex.hasMatch(value)) {
                          return 'Enter a valid name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: varHeight),
                    CommonTextformfield(
                      controller: emailController,
                      labelText: Strings.labelTextForEmail,
                      errorText: Strings.errorTextForEmail,
                      validator: (value) {
                        final emailRegex = RegExp(Strings.emailRegex);
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!emailRegex.hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: varHeight),
                    CommonTextformfield(
                      controller: passwordController,
                      labelText: Strings.labelTextForPassword,
                      errorText: Strings.errorTextForPassword,
                      validator: (value) {
                        final passwordRegex = RegExp(Strings.passwordRegex);
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (!passwordRegex.hasMatch(value)) {
                          return 'Password must contain at least 8 characters,'
                              '\n including uppercase, lowercase, digit, and special character';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: varHeight),
                    CommonTextformfield(
                      controller: phoneController,
                      labelText: Strings.labelTextForPhone,
                      errorText: Strings.errorTextForPhone,
                      maxLength: 10,
                      validator: (value) {
                        //  final phoneRegex = RegExp(Strings.phoneRegex);
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: varHeight),
                    Padding(
                      padding: EdgeInsets.only(
                          top: context.height(context) * 0.01,
                          bottom: context.height(context) * 0.03),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: ThemeColors.black,
                                thickness: 1,
                                endIndent: 10,
                              ),
                            ),
                            Text(
                              Strings.or,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Expanded(
                              child: Divider(
                                color: ThemeColors.black,
                                thickness: 1,
                                indent: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SignUpButton(
                      buttonImage: AssetsSvgImage.googleImage,
                      buttonTitle: Strings.googleLogin,
                    ),
                    SizedBox(height: varHeight),
                    Center(
                      child: CommonSaveButton(
                        formKey: formKey,
                        onTap: () async {
                          // if (formKey.currentState!.validate()) {
                          //   formKey.currentState!.save();
                          //   if (formKey.currentState?.validate() ?? false) {
                          //     context.read<RegistrationBloc>().add(
                          //       RegisterUserEvent(
                          //         email: emailController.text,
                          //         password: passwordController.text,
                          //         name: nameController.text,
                          //       ),
                          //     );
                          //     registerUser();
                          //   }
                          //   var snackBar = const SnackBar(
                          //       content: Text(Strings.submittedSuccessfully));
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(snackBar);
                          // }
                          setState(() {
                            registerUser();
                          });
                        },
                        name: Strings.saveContinue,
                      ),
                    ),
                    SizedBox(height: context.height(context) * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Strings.alreadyHaveAccount,
                            style: Theme.of(context).textTheme.bodyLarge),
                        GestureDetector(
                            onTap: () {
                              context.push(context,
                                  target: const LoginScreen());
                            },
                            child: Text(Strings.loginHere,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: ThemeColors.mainGreenColor)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
