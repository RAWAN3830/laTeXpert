import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/theme_data/breakpoint_enum.dart';
import 'package:latexpert/infra/bloc/auth_bloc/email_login/login_bloc.dart';
import 'package:latexpert/infra/bloc/declaration_bloc/declaration_bloc.dart';
import 'package:latexpert/infra/bloc/experiences_bloc/experiences_bloc.dart';
import 'package:latexpert/infra/bloc/personal_info_bloc/personal_info_bloc_cubit.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_bloc.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_state.dart';
import 'package:latexpert/infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/constant/strings.dart';
import 'firebase_options.dart';
import 'infra/bloc/auth_bloc/email_auth/email_auth_bloc.dart';
import 'infra/bloc/auth_bloc/google_auth/google_auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'presentation/bottom_navigation_bar/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegistrationBloc(),
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (context) => PersonalInfoCubit(),
          ),
          BlocProvider(
            create: (context) => SkillsSetBlocCubit(),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(),
          ),
          BlocProvider(
            create: (context) => DeclarationCubit(),
          ),
          BlocProvider(
            create: (context) => ExperienceCubit(),
          )
        ],
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            // final themeData = state is LightThemeState
            //     ? state.themeData
            //     : (state as DarkThemeState).themeData;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // theme: themeData,
              theme: ThemeData(
                fontFamily: Strings.uberFont,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
                useMaterial3: true,
              ),
              // home: const WorkSpaceStepper(),
              // home: const BottomNavigationBarScreen(),
              // home: const SplashScreen(),
              home: const BottomNavigationBarScreen(),
              //  home: const RegistrationScreen(),
            );
          },
        ),
      ),
      breakpoints: [
        BreakpointEnum.mobile.point,
        BreakpointEnum.tablet.point,
        BreakpointEnum.desktop.point,
      ],
    );
  }
}
