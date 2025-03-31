// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectMasterModel _$ProjectMasterModelFromJson(Map<String, dynamic> json) {
  return _ProjectMasterModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectMasterModel {
  List<ProjectInfoModel> get projectMasterModel =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectMasterModelCopyWith<ProjectMasterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectMasterModelCopyWith<$Res> {
  factory $ProjectMasterModelCopyWith(
          ProjectMasterModel value, $Res Function(ProjectMasterModel) then) =
      _$ProjectMasterModelCopyWithImpl<$Res, ProjectMasterModel>;
  @useResult
  $Res call({List<ProjectInfoModel> projectMasterModel});
}

/// @nodoc
class _$ProjectMasterModelCopyWithImpl<$Res, $Val extends ProjectMasterModel>
    implements $ProjectMasterModelCopyWith<$Res> {
  _$ProjectMasterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectMasterModel = null,
  }) {
    return _then(_value.copyWith(
      projectMasterModel: null == projectMasterModel
          ? _value.projectMasterModel
          : projectMasterModel // ignore: cast_nullable_to_non_nullable
              as List<ProjectInfoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectMasterModelImplCopyWith<$Res>
    implements $ProjectMasterModelCopyWith<$Res> {
  factory _$$ProjectMasterModelImplCopyWith(_$ProjectMasterModelImpl value,
          $Res Function(_$ProjectMasterModelImpl) then) =
      __$$ProjectMasterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProjectInfoModel> projectMasterModel});
}

/// @nodoc
class __$$ProjectMasterModelImplCopyWithImpl<$Res>
    extends _$ProjectMasterModelCopyWithImpl<$Res, _$ProjectMasterModelImpl>
    implements _$$ProjectMasterModelImplCopyWith<$Res> {
  __$$ProjectMasterModelImplCopyWithImpl(_$ProjectMasterModelImpl _value,
      $Res Function(_$ProjectMasterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectMasterModel = null,
  }) {
    return _then(_$ProjectMasterModelImpl(
      projectMasterModel: null == projectMasterModel
          ? _value._projectMasterModel
          : projectMasterModel // ignore: cast_nullable_to_non_nullable
              as List<ProjectInfoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectMasterModelImpl implements _ProjectMasterModel {
  const _$ProjectMasterModelImpl(
      {required final List<ProjectInfoModel> projectMasterModel})
      : _projectMasterModel = projectMasterModel;

  factory _$ProjectMasterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectMasterModelImplFromJson(json);

  final List<ProjectInfoModel> _projectMasterModel;
  @override
  List<ProjectInfoModel> get projectMasterModel {
    if (_projectMasterModel is EqualUnmodifiableListView)
      return _projectMasterModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectMasterModel);
  }

  @override
  String toString() {
    return 'ProjectMasterModel(projectMasterModel: $projectMasterModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectMasterModelImpl &&
            const DeepCollectionEquality()
                .equals(other._projectMasterModel, _projectMasterModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_projectMasterModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectMasterModelImplCopyWith<_$ProjectMasterModelImpl> get copyWith =>
      __$$ProjectMasterModelImplCopyWithImpl<_$ProjectMasterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectMasterModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectMasterModel implements ProjectMasterModel {
  const factory _ProjectMasterModel(
          {required final List<ProjectInfoModel> projectMasterModel}) =
      _$ProjectMasterModelImpl;

  factory _ProjectMasterModel.fromJson(Map<String, dynamic> json) =
      _$ProjectMasterModelImpl.fromJson;

  @override
  List<ProjectInfoModel> get projectMasterModel;
  @override
  @JsonKey(ignore: true)
  _$$ProjectMasterModelImplCopyWith<_$ProjectMasterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectInfoModel _$ProjectInfoModelFromJson(Map<String, dynamic> json) {
  return _ProjectInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectInfoModel {
  String get projectTitle => throw _privateConstructorUsedError;
  String get technologiesUsed => throw _privateConstructorUsedError;
  String get projectLink => throw _privateConstructorUsedError;
  String get projectDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectInfoModelCopyWith<ProjectInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectInfoModelCopyWith<$Res> {
  factory $ProjectInfoModelCopyWith(
          ProjectInfoModel value, $Res Function(ProjectInfoModel) then) =
      _$ProjectInfoModelCopyWithImpl<$Res, ProjectInfoModel>;
  @useResult
  $Res call(
      {String projectTitle,
      String technologiesUsed,
      String projectLink,
      String projectDescription});
}

/// @nodoc
class _$ProjectInfoModelCopyWithImpl<$Res, $Val extends ProjectInfoModel>
    implements $ProjectInfoModelCopyWith<$Res> {
  _$ProjectInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTitle = null,
    Object? technologiesUsed = null,
    Object? projectLink = null,
    Object? projectDescription = null,
  }) {
    return _then(_value.copyWith(
      projectTitle: null == projectTitle
          ? _value.projectTitle
          : projectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      technologiesUsed: null == technologiesUsed
          ? _value.technologiesUsed
          : technologiesUsed // ignore: cast_nullable_to_non_nullable
              as String,
      projectLink: null == projectLink
          ? _value.projectLink
          : projectLink // ignore: cast_nullable_to_non_nullable
              as String,
      projectDescription: null == projectDescription
          ? _value.projectDescription
          : projectDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectInfoModelImplCopyWith<$Res>
    implements $ProjectInfoModelCopyWith<$Res> {
  factory _$$ProjectInfoModelImplCopyWith(_$ProjectInfoModelImpl value,
          $Res Function(_$ProjectInfoModelImpl) then) =
      __$$ProjectInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectTitle,
      String technologiesUsed,
      String projectLink,
      String projectDescription});
}

/// @nodoc
class __$$ProjectInfoModelImplCopyWithImpl<$Res>
    extends _$ProjectInfoModelCopyWithImpl<$Res, _$ProjectInfoModelImpl>
    implements _$$ProjectInfoModelImplCopyWith<$Res> {
  __$$ProjectInfoModelImplCopyWithImpl(_$ProjectInfoModelImpl _value,
      $Res Function(_$ProjectInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTitle = null,
    Object? technologiesUsed = null,
    Object? projectLink = null,
    Object? projectDescription = null,
  }) {
    return _then(_$ProjectInfoModelImpl(
      projectTitle: null == projectTitle
          ? _value.projectTitle
          : projectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      technologiesUsed: null == technologiesUsed
          ? _value.technologiesUsed
          : technologiesUsed // ignore: cast_nullable_to_non_nullable
              as String,
      projectLink: null == projectLink
          ? _value.projectLink
          : projectLink // ignore: cast_nullable_to_non_nullable
              as String,
      projectDescription: null == projectDescription
          ? _value.projectDescription
          : projectDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectInfoModelImpl implements _ProjectInfoModel {
  const _$ProjectInfoModelImpl(
      {required this.projectTitle,
      required this.technologiesUsed,
      required this.projectLink,
      required this.projectDescription});

  factory _$ProjectInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectInfoModelImplFromJson(json);

  @override
  final String projectTitle;
  @override
  final String technologiesUsed;
  @override
  final String projectLink;
  @override
  final String projectDescription;

  @override
  String toString() {
    return 'ProjectInfoModel(projectTitle: $projectTitle, technologiesUsed: $technologiesUsed, projectLink: $projectLink, projectDescription: $projectDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectInfoModelImpl &&
            (identical(other.projectTitle, projectTitle) ||
                other.projectTitle == projectTitle) &&
            (identical(other.technologiesUsed, technologiesUsed) ||
                other.technologiesUsed == technologiesUsed) &&
            (identical(other.projectLink, projectLink) ||
                other.projectLink == projectLink) &&
            (identical(other.projectDescription, projectDescription) ||
                other.projectDescription == projectDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectTitle, technologiesUsed,
      projectLink, projectDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectInfoModelImplCopyWith<_$ProjectInfoModelImpl> get copyWith =>
      __$$ProjectInfoModelImplCopyWithImpl<_$ProjectInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectInfoModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectInfoModel implements ProjectInfoModel {
  const factory _ProjectInfoModel(
      {required final String projectTitle,
      required final String technologiesUsed,
      required final String projectLink,
      required final String projectDescription}) = _$ProjectInfoModelImpl;

  factory _ProjectInfoModel.fromJson(Map<String, dynamic> json) =
      _$ProjectInfoModelImpl.fromJson;

  @override
  String get projectTitle;
  @override
  String get technologiesUsed;
  @override
  String get projectLink;
  @override
  String get projectDescription;
  @override
  @JsonKey(ignore: true)
  _$$ProjectInfoModelImplCopyWith<_$ProjectInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
