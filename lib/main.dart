import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/theme_data/apptheme.dart';
import 'package:latexpert/core/theme_data/breakpoint_enum.dart';
import 'package:latexpert/infra/bloc/auth_bloc/email_login/login_bloc.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_bloc.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_state.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'presentation/bottom_navigation_bar/bottom_navigation_bar.dart';

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
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        // Add other BLoCs as needed
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
              home: const BottomNavigationBarScreen(),
            );
          },
        ),
      ),
    );
  }
}