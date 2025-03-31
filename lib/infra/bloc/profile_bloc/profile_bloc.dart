import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_event.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_state.dart';



class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(LightThemeState(ThemeData.light())) {
    on<ToggleThemeEvent>((event, emit) {
      if (state is LightThemeState) {
        emit(DarkThemeState(ThemeData.dark(
          useMaterial3: true,

        )));
      } else {
        emit(LightThemeState(ThemeData.light(
          useMaterial3: true,
        )));
      }
    });
  }
}
