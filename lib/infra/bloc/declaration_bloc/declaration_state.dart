import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:latexpert/domain/declaration_model/declaration_model.dart';

part 'declaration_state.freezed.dart';

@freezed
class DeclarationState with _$DeclarationState {
  const factory DeclarationState.initial() = _DeclarationStateInitial;
  const factory DeclarationState.loading() = _DeclarationStateLoading;
  const factory DeclarationState.success({
    required List<DeclarationModel> declarationList,
  }) = _DeclarationStateSuccess;
  const factory DeclarationState.failure({
    String? errorMessage,
  }) = _DeclarationStateFailure;
}