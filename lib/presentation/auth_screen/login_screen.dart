import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dio/dio.dart';
import 'package:latexpert/core/constant/assets_svg_image.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/core/constant/theme_colors.dart';
import 'package:latexpert/infra/bloc/auth_bloc/email_login/login_bloc.dart';
import 'package:latexpert/infra/bloc/auth_bloc/email_login/login_state.dart';
import 'package:latexpert/presentation/auth_screen/registration_screen.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/sign_up_button.dart';
import 'package:latexpert/presentation/common_widgets/common_text/common_richtext.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:latexpert/presentation/home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final String loginUrl = "${Strings.baseUrl}auth/login";
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> loginUser() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showError('All fields are required');
      return;
    }

    try {
      final dio = Dio();
      final response = await dio.post(
        loginUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        data: {
          'email': email,
          'password': password,
        },
      );

      Future<void> fetchData() async {
        const String apiUrl = "http://192.168.1.15:8000/api/protected-route";

        try {
          final dio = Dio();
          final String? token = await secureStorage.read(key: 'jwt_token');

          if (token == null) {
            showError('No token found. Please log in again.');
            return;
          }

          final response = await dio.get(
            apiUrl,
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',  // Pass the token in the header
                'Content-Type': 'application/json',
              },
            ),
          );

          if (response.statusCode == 200) {
            showSuccess('Data fetched successfully: ${response.data}');
          } else {
            showError('Failed to fetch data: ${response.data}');
          }
        } catch (e) {
          showError('Error: $e');
        }
      }


      if (response.statusCode == 200 && response.data['success'] == true) {
        final token = response.data['token'];
        await secureStorage.write(key: 'jwt_token', value: token);
        showSuccess('Login successful');

        // Navigate to the home screen after successful login
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
              (route) => false,
        );
      } else {
        showError('Failed to login: ${response.data['msg']}');
      }
    } catch (e) {
      showError('Error: $e');
    }
  }

  Future<void> logout() async {
    await secureStorage.delete(key: 'jwt_token');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
    );
  }


  void showError(String message) {
    print(message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.red))),
    );
  }

  void showSuccess(String message) {
    print(message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.green))),
    );
  }

  @override
  Widget build(BuildContext context) {
    var varHeight = context.height(context) * 0.02;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(context.height(context) * 0.02)
                .copyWith(top: context.height(context) * 0.085),
            child: BlocConsumer<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is LoginLoading)
                      const Center(child: CircularProgressIndicator()),
                    if (state is LoginFailure)
                      Text(
                        "${Strings.errorPrefix} ${state.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(height: varHeight),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(context.height(context) * 0.015),
                        child: SvgPicture.asset(
                          AssetsSvgImage.loginImage,
                          height: context.height(context) * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const CommonRichText(title: Strings.login),
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
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: context.height(context) * 0.025,
                          bottom: context.height(context) * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                                  color: ThemeColors.black,
                                  endIndent: context.width(context) * 0.03)),
                          Text(
                            Strings.or,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Expanded(
                              child: Divider(
                                color: ThemeColors.black,
                                indent: context.width(context) * 0.03,
                              ))
                        ],
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
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              loginUser();
                            }
                          },
                          name: Strings.loginButton),
                    ),
                    SizedBox(height: varHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Strings.noAccountPrompt, style: Theme.of(context).textTheme.bodyLarge),
                        GestureDetector(onTap:(){
                          context.push(context, target: const RegistrationScreen());
                        },child: Text(Strings.registerHere, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500,color: ThemeColors.mainGreenColor),))
                      ],
                    )
                  ],
                );
              },
              listener: (context, state) {
                if (state is LoginSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(Strings.successMessage)),
                  );
                  context.pushAndRemoveUntil(context,
                      target: const HomeScreen());
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${Strings.errorPrefix} ${state.error}')),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

