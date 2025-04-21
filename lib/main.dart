import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/theme_data/apptheme.dart';
import 'package:latexpert/core/theme_data/breakpoint_enum.dart';
import 'package:latexpert/infra/bloc/achievement_bloc/achievement_bloc_cubit.dart';
import 'package:latexpert/infra/bloc/auth_bloc/google_auth/google_auth_bloc.dart';
import 'package:latexpert/infra/bloc/declaration_bloc/declaration_bloc.dart';
import 'package:latexpert/infra/bloc/education_bloc/education_bloc_cubit.dart';
import 'package:latexpert/infra/bloc/experiences_bloc/experiences_bloc.dart';
import 'package:latexpert/infra/bloc/personal_info_bloc/personal_info_bloc_cubit.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_bloc.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_state.dart';
import 'package:latexpert/infra/bloc/skills_set_bloc/skills_set_bloc_cubit.dart';
import 'package:latexpert/presentation/Resume_builder_screen/education_screen/education_info_screen.dart';
import 'package:latexpert/presentation/auth_screen/login_screen.dart';
import 'package:latexpert/presentation/home_screen/home_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'infra/bloc/auth_bloc/email_auth/login_user/login_bloc_cubit.dart';
import 'infra/bloc/auth_bloc/email_auth/registration_user/registration_bloc_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationBlocCubit(),
        ),
        BlocProvider(
          create: (context) => LoginBlocCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => EducationCubit(),
          child: const EducationInfoScreen(),
        ),
        BlocProvider(
          create: (context) => PersonalInfoBlocCubit(),
        ),
        BlocProvider(
          create: (context) => SkillsSetBlocCubit(),
        ),
        BlocProvider(
          create: (context) => AchievementCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => DeclarationCubit(),
        ),
        BlocProvider(
          create: (context) => ExperiencesBlocCubit(),
        )
      ],
      child: ResponsiveBreakpoints.builder(
        breakpoints: BreakpointEnum.values.map((e) => e.point).toList(),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            final isDark = state is DarkThemeState;
            final breakpoint = BreakpointEnum.fromWidth(
              ResponsiveBreakpoints.of(context).screenWidth,
            );
            return MaterialApp(
              debugShowCheckedModeBanner: false,
                 theme: AppTheme.getTheme(breakpoint, isDark: isDark),
                 //home: const LoginScreen(),
                home: const HomeScreen(),
              // home:  const DynamicResumeForm(),
            );
          },
        ),
      ),
    );
  }
}
