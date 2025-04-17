import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latexpert/core/constant/assets_svg_image.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/core/constant/theme_colors.dart';
import 'package:latexpert/presentation/auth_screen/registration_screen.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:latexpert/presentation/common_widgets/common_buttons/sign_up_button.dart';
import 'package:latexpert/presentation/common_widgets/common_text/common_richtext.dart';
import 'package:latexpert/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:latexpert/presentation/home_screen/home_screen.dart';

import '../../infra/bloc/auth_bloc/email_auth/login_user/login_bloc_cubit.dart';
import '../../infra/bloc/auth_bloc/email_auth/login_user/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
            child: BlocConsumer<LoginBlocCubit, LoginState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state.maybeMap(
                      orElse: () => SizedBox.shrink(),
                      loading: (_) => const Center(child: CircularProgressIndicator()),
                      failure: (failure) => Text(
                        "${Strings.errorPrefix} ${failure.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
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
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            // Trigger login using Cubit
                            context.read<LoginBlocCubit>().loginUser(
                              email: email,
                              password: password,
                            );
                          }
                        },
                        name: Strings.loginButton,
                      ),
                    ),
                    SizedBox(height: varHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Strings.noAccountPrompt, style: Theme.of(context).textTheme.bodyLarge),
                        GestureDetector(
                          onTap: () {
                            context.push(context, target: const RegistrationScreen());
                          },
                          child: Text(
                            Strings.registerHere,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.mainGreenColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  success: (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(Strings.successMessage)),
                    );
                    context.pushAndRemoveUntil(context, target: const HomeScreen());
                  },
                  failure: (failure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${Strings.errorPrefix} $failure')),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
