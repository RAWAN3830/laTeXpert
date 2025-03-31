import 'package:flutter/material.dart';

abstract class ProfileState {}

class LightThemeState extends ProfileState {
  final ThemeData themeData;

  LightThemeState(this.themeData);
}

class DarkThemeState extends ProfileState {
  final ThemeData themeData;

  DarkThemeState(this.themeData);
}
