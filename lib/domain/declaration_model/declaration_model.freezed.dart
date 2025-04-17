// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'declaration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeclarationMasterModel _$DeclarationMasterModelFromJson(
    Map<String, dynamic> json) {
  return _DeclarationMasterModel.fromJson(json);
}

/// @nodoc
mixin _$DeclarationMasterModel {
  List<DeclarationModel> get declarations => throw _privateConstructorUsedError;

  /// Serializes this DeclarationMasterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeclarationMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclarationMasterModelCopyWith<DeclarationMasterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclarationMasterModelCopyWith<$Res> {
  factory $DeclarationMasterModelCopyWith(DeclarationMasterModel value,
          $Res Function(DeclarationMasterModel) then) =
      _$DeclarationMasterModelCopyWithImpl<$Res, DeclarationMasterModel>;
  @useResult
  $Res call({List<DeclarationModel> declarations});
}

/// @nodoc
class _$DeclarationMasterModelCopyWithImpl<$Res,
        $Val extends DeclarationMasterModel>
    implements $DeclarationMasterModelCopyWith<$Res> {
  _$DeclarationMasterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclarationMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? declarations = null,
  }) {
    return _then(_value.copyWith(
      declarations: null == declarations
          ? _value.declarations
          : declarations // ignore: cast_nullable_to_non_nullable
              as List<DeclarationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeclarationMasterModelImplCopyWith<$Res>
    implements $DeclarationMasterModelCopyWith<$Res> {
  factory _$$DeclarationMasterModelImplCopyWith(
          _$DeclarationMasterModelImpl value,
          $Res Function(_$DeclarationMasterModelImpl) then) =
      __$$DeclarationMasterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DeclarationModel> declarations});
}

/// @nodoc
class __$$DeclarationMasterModelImplCopyWithImpl<$Res>
    extends _$DeclarationMasterModelCopyWithImpl<$Res,
        _$DeclarationMasterModelImpl>
    implements _$$DeclarationMasterModelImplCopyWith<$Res> {
  __$$DeclarationMasterModelImplCopyWithImpl(
      _$DeclarationMasterModelImpl _value,
      $Res Function(_$DeclarationMasterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeclarationMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? declarations = null,
  }) {
    return _then(_$DeclarationMasterModelImpl(
      declarations: null == declarations
          ? _value._declarations
          : declarations // ignore: cast_nullable_to_non_nullable
              as List<DeclarationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeclarationMasterModelImpl implements _DeclarationMasterModel {
  const _$DeclarationMasterModelImpl(
      {required final List<DeclarationModel> declarations})
      : _declarations = declarations;

  factory _$DeclarationMasterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeclarationMasterModelImplFromJson(json);

  final List<DeclarationModel> _declarations;
  @override
  List<DeclarationModel> get declarations {
    if (_declarations is EqualUnmodifiableListView) return _declarations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_declarations);
  }

  @override
  String toString() {
    return 'DeclarationMasterModel(declarations: $declarations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclarationMasterModelImpl &&
            const DeepCollectionEquality()
                .equals(other._declarations, _declarations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_declarations));

  /// Create a copy of DeclarationMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclarationMasterModelImplCopyWith<_$DeclarationMasterModelImpl>
      get copyWith => __$$DeclarationMasterModelImplCopyWithImpl<
          _$DeclarationMasterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeclarationMasterModelImplToJson(
      this,
    );
  }
}

abstract class _DeclarationMasterModel implements DeclarationMasterModel {
  const factory _DeclarationMasterModel(
          {required final List<DeclarationModel> declarations}) =
      _$DeclarationMasterModelImpl;

  factory _DeclarationMasterModel.fromJson(Map<String, dynamic> json) =
      _$DeclarationMasterModelImpl.fromJson;

  @override
  List<DeclarationModel> get declarations;

  /// Create a copy of DeclarationMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclarationMasterModelImplCopyWith<_$DeclarationMasterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeclarationModel _$DeclarationModelFromJson(Map<String, dynamic> json) {
  return _DeclarationModel.fromJson(json);
}

/// @nodoc
mixin _$DeclarationModel {
  String get honorAwardTitle => throw _privateConstructorUsedError;

  /// Serializes this DeclarationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeclarationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclarationModelCopyWith<DeclarationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclarationModelCopyWith<$Res> {
  factory $DeclarationModelCopyWith(
          DeclarationModel value, $Res Function(DeclarationModel) then) =
      _$DeclarationModelCopyWithImpl<$Res, DeclarationModel>;
  @useResult
  $Res call({String honorAwardTitle});
}

/// @nodoc
class _$DeclarationModelCopyWithImpl<$Res, $Val extends DeclarationModel>
    implements $DeclarationModelCopyWith<$Res> {
  _$DeclarationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclarationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? honorAwardTitle = null,
  }) {
    return _then(_value.copyWith(
      honorAwardTitle: null == honorAwardTitle
          ? _value.honorAwardTitle
          : honorAwardTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeclarationModelImplCopyWith<$Res>
    implements $DeclarationModelCopyWith<$Res> {
  factory _$$DeclarationModelImplCopyWith(_$DeclarationModelImpl value,
          $Res Function(_$DeclarationModelImpl) then) =
      __$$DeclarationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String honorAwardTitle});
}

/// @nodoc
class __$$DeclarationModelImplCopyWithImpl<$Res>
    extends _$DeclarationModelCopyWithImpl<$Res, _$DeclarationModelImpl>
    implements _$$DeclarationModelImplCopyWith<$Res> {
  __$$DeclarationModelImplCopyWithImpl(_$DeclarationModelImpl _value,
      $Res Function(_$DeclarationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeclarationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? honorAwardTitle = null,
  }) {
    return _then(_$DeclarationModelImpl(
      honorAwardTitle: null == honorAwardTitle
          ? _value.honorAwardTitle
          : honorAwardTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeclarationModelImpl implements _DeclarationModel {
  const _$DeclarationModelImpl({required this.honorAwardTitle});

  factory _$DeclarationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeclarationModelImplFromJson(json);

  @override
  final String honorAwardTitle;

  @override
  String toString() {
    return 'DeclarationModel(honorAwardTitle: $honorAwardTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclarationModelImpl &&
            (identical(other.honorAwardTitle, honorAwardTitle) ||
                other.honorAwardTitle == honorAwardTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, honorAwardTitle);

  /// Create a copy of DeclarationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclarationModelImplCopyWith<_$DeclarationModelImpl> get copyWith =>
      __$$DeclarationModelImplCopyWithImpl<_$DeclarationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeclarationModelImplToJson(
      this,
    );
  }
}

abstract class _DeclarationModel implements DeclarationModel {
  const factory _DeclarationModel({required final String honorAwardTitle}) =
      _$DeclarationModelImpl;

  factory _DeclarationModel.fromJson(Map<String, dynamic> json) =
      _$DeclarationModelImpl.fromJson;

  @override
  String get honorAwardTitle;

  /// Create a copy of DeclarationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclarationModelImplCopyWith<_$DeclarationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
