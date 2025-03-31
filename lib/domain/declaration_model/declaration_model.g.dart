// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'declaration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeclarationMasterModelImpl _$$DeclarationMasterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeclarationMasterModelImpl(
      declarations: (json['declarations'] as List<dynamic>)
          .map((e) => DeclarationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DeclarationMasterModelImplToJson(
        _$DeclarationMasterModelImpl instance) =>
    <String, dynamic>{
      'declarations': instance.declarations,
    };

_$DeclarationModelImpl _$$DeclarationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeclarationModelImpl(
      honorAwardTitle: json['honorAwardTitle'] as String,
    );

Map<String, dynamic> _$$DeclarationModelImplToJson(
        _$DeclarationModelImpl instance) =>
    <String, dynamic>{
      'honorAwardTitle': instance.honorAwardTitle,
    };
