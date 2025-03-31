import 'package:freezed_annotation/freezed_annotation.dart';

part 'declaration_model.freezed.dart';
part 'declaration_model.g.dart';

@freezed
class DeclarationMasterModel with _$DeclarationMasterModel {
  const factory DeclarationMasterModel({
    required List<DeclarationModel> declarations,
  }) = _DeclarationMasterModel;

  factory DeclarationMasterModel.fromJson(Map<String, dynamic> json) => _$DeclarationMasterModelFromJson(json);
}


@freezed
class DeclarationModel with _$DeclarationModel {
  const factory DeclarationModel({
    required String honorAwardTitle,
  }) = _DeclarationModel;

  factory DeclarationModel.fromJson(Map<String, dynamic> json) => _$DeclarationModelFromJson(json);
}
