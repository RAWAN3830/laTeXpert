// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SkillCategoryMasterModel _$SkillCategoryMasterModelFromJson(
    Map<String, dynamic> json) {
  return _SkillCategoryMasterModel.fromJson(json);
}

/// @nodoc
mixin _$SkillCategoryMasterModel {
  List<SkillCategoryModel> get skillCategories =>
      throw _privateConstructorUsedError;

  /// Serializes this SkillCategoryMasterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillCategoryMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillCategoryMasterModelCopyWith<SkillCategoryMasterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillCategoryMasterModelCopyWith<$Res> {
  factory $SkillCategoryMasterModelCopyWith(SkillCategoryMasterModel value,
          $Res Function(SkillCategoryMasterModel) then) =
      _$SkillCategoryMasterModelCopyWithImpl<$Res, SkillCategoryMasterModel>;
  @useResult
  $Res call({List<SkillCategoryModel> skillCategories});
}

/// @nodoc
class _$SkillCategoryMasterModelCopyWithImpl<$Res,
        $Val extends SkillCategoryMasterModel>
    implements $SkillCategoryMasterModelCopyWith<$Res> {
  _$SkillCategoryMasterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillCategoryMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillCategories = null,
  }) {
    return _then(_value.copyWith(
      skillCategories: null == skillCategories
          ? _value.skillCategories
          : skillCategories // ignore: cast_nullable_to_non_nullable
              as List<SkillCategoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillCategoryMasterModelImplCopyWith<$Res>
    implements $SkillCategoryMasterModelCopyWith<$Res> {
  factory _$$SkillCategoryMasterModelImplCopyWith(
          _$SkillCategoryMasterModelImpl value,
          $Res Function(_$SkillCategoryMasterModelImpl) then) =
      __$$SkillCategoryMasterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SkillCategoryModel> skillCategories});
}

/// @nodoc
class __$$SkillCategoryMasterModelImplCopyWithImpl<$Res>
    extends _$SkillCategoryMasterModelCopyWithImpl<$Res,
        _$SkillCategoryMasterModelImpl>
    implements _$$SkillCategoryMasterModelImplCopyWith<$Res> {
  __$$SkillCategoryMasterModelImplCopyWithImpl(
      _$SkillCategoryMasterModelImpl _value,
      $Res Function(_$SkillCategoryMasterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillCategoryMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillCategories = null,
  }) {
    return _then(_$SkillCategoryMasterModelImpl(
      skillCategories: null == skillCategories
          ? _value._skillCategories
          : skillCategories // ignore: cast_nullable_to_non_nullable
              as List<SkillCategoryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillCategoryMasterModelImpl implements _SkillCategoryMasterModel {
  const _$SkillCategoryMasterModelImpl(
      {required final List<SkillCategoryModel> skillCategories})
      : _skillCategories = skillCategories;

  factory _$SkillCategoryMasterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillCategoryMasterModelImplFromJson(json);

  final List<SkillCategoryModel> _skillCategories;
  @override
  List<SkillCategoryModel> get skillCategories {
    if (_skillCategories is EqualUnmodifiableListView) return _skillCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skillCategories);
  }

  @override
  String toString() {
    return 'SkillCategoryMasterModel(skillCategories: $skillCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillCategoryMasterModelImpl &&
            const DeepCollectionEquality()
                .equals(other._skillCategories, _skillCategories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_skillCategories));

  /// Create a copy of SkillCategoryMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillCategoryMasterModelImplCopyWith<_$SkillCategoryMasterModelImpl>
      get copyWith => __$$SkillCategoryMasterModelImplCopyWithImpl<
          _$SkillCategoryMasterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillCategoryMasterModelImplToJson(
      this,
    );
  }
}

abstract class _SkillCategoryMasterModel implements SkillCategoryMasterModel {
  const factory _SkillCategoryMasterModel(
          {required final List<SkillCategoryModel> skillCategories}) =
      _$SkillCategoryMasterModelImpl;

  factory _SkillCategoryMasterModel.fromJson(Map<String, dynamic> json) =
      _$SkillCategoryMasterModelImpl.fromJson;

  @override
  List<SkillCategoryModel> get skillCategories;

  /// Create a copy of SkillCategoryMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillCategoryMasterModelImplCopyWith<_$SkillCategoryMasterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SkillCategoryModel _$SkillCategoryModelFromJson(Map<String, dynamic> json) {
  return _SkillCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$SkillCategoryModel {
  String get name => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;

  /// Serializes this SkillCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillCategoryModelCopyWith<SkillCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillCategoryModelCopyWith<$Res> {
  factory $SkillCategoryModelCopyWith(
          SkillCategoryModel value, $Res Function(SkillCategoryModel) then) =
      _$SkillCategoryModelCopyWithImpl<$Res, SkillCategoryModel>;
  @useResult
  $Res call({String name, List<String> skills});
}

/// @nodoc
class _$SkillCategoryModelCopyWithImpl<$Res, $Val extends SkillCategoryModel>
    implements $SkillCategoryModelCopyWith<$Res> {
  _$SkillCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? skills = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillCategoryModelImplCopyWith<$Res>
    implements $SkillCategoryModelCopyWith<$Res> {
  factory _$$SkillCategoryModelImplCopyWith(_$SkillCategoryModelImpl value,
          $Res Function(_$SkillCategoryModelImpl) then) =
      __$$SkillCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> skills});
}

/// @nodoc
class __$$SkillCategoryModelImplCopyWithImpl<$Res>
    extends _$SkillCategoryModelCopyWithImpl<$Res, _$SkillCategoryModelImpl>
    implements _$$SkillCategoryModelImplCopyWith<$Res> {
  __$$SkillCategoryModelImplCopyWithImpl(_$SkillCategoryModelImpl _value,
      $Res Function(_$SkillCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? skills = null,
  }) {
    return _then(_$SkillCategoryModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillCategoryModelImpl implements _SkillCategoryModel {
  const _$SkillCategoryModelImpl(
      {required this.name, required final List<String> skills})
      : _skills = skills;

  factory _$SkillCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillCategoryModelImplFromJson(json);

  @override
  final String name;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  String toString() {
    return 'SkillCategoryModel(name: $name, skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillCategoryModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_skills));

  /// Create a copy of SkillCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillCategoryModelImplCopyWith<_$SkillCategoryModelImpl> get copyWith =>
      __$$SkillCategoryModelImplCopyWithImpl<_$SkillCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _SkillCategoryModel implements SkillCategoryModel {
  const factory _SkillCategoryModel(
      {required final String name,
      required final List<String> skills}) = _$SkillCategoryModelImpl;

  factory _SkillCategoryModel.fromJson(Map<String, dynamic> json) =
      _$SkillCategoryModelImpl.fromJson;

  @override
  String get name;
  @override
  List<String> get skills;

  /// Create a copy of SkillCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillCategoryModelImplCopyWith<_$SkillCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
