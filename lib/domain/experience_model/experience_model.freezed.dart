// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExperienceMasterModel _$ExperienceMasterModelFromJson(
    Map<String, dynamic> json) {
  return _ExperienceMasterModel.fromJson(json);
}

/// @nodoc
mixin _$ExperienceMasterModel {
  List<ExperienceModel> get experiences => throw _privateConstructorUsedError;

  /// Serializes this ExperienceMasterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExperienceMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExperienceMasterModelCopyWith<ExperienceMasterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceMasterModelCopyWith<$Res> {
  factory $ExperienceMasterModelCopyWith(ExperienceMasterModel value,
          $Res Function(ExperienceMasterModel) then) =
      _$ExperienceMasterModelCopyWithImpl<$Res, ExperienceMasterModel>;
  @useResult
  $Res call({List<ExperienceModel> experiences});
}

/// @nodoc
class _$ExperienceMasterModelCopyWithImpl<$Res,
        $Val extends ExperienceMasterModel>
    implements $ExperienceMasterModelCopyWith<$Res> {
  _$ExperienceMasterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExperienceMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experiences = null,
  }) {
    return _then(_value.copyWith(
      experiences: null == experiences
          ? _value.experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<ExperienceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExperienceMasterModelImplCopyWith<$Res>
    implements $ExperienceMasterModelCopyWith<$Res> {
  factory _$$ExperienceMasterModelImplCopyWith(
          _$ExperienceMasterModelImpl value,
          $Res Function(_$ExperienceMasterModelImpl) then) =
      __$$ExperienceMasterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ExperienceModel> experiences});
}

/// @nodoc
class __$$ExperienceMasterModelImplCopyWithImpl<$Res>
    extends _$ExperienceMasterModelCopyWithImpl<$Res,
        _$ExperienceMasterModelImpl>
    implements _$$ExperienceMasterModelImplCopyWith<$Res> {
  __$$ExperienceMasterModelImplCopyWithImpl(_$ExperienceMasterModelImpl _value,
      $Res Function(_$ExperienceMasterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExperienceMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experiences = null,
  }) {
    return _then(_$ExperienceMasterModelImpl(
      experiences: null == experiences
          ? _value._experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<ExperienceModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperienceMasterModelImpl implements _ExperienceMasterModel {
  const _$ExperienceMasterModelImpl(
      {required final List<ExperienceModel> experiences})
      : _experiences = experiences;

  factory _$ExperienceMasterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperienceMasterModelImplFromJson(json);

  final List<ExperienceModel> _experiences;
  @override
  List<ExperienceModel> get experiences {
    if (_experiences is EqualUnmodifiableListView) return _experiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experiences);
  }

  @override
  String toString() {
    return 'ExperienceMasterModel(experiences: $experiences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceMasterModelImpl &&
            const DeepCollectionEquality()
                .equals(other._experiences, _experiences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_experiences));

  /// Create a copy of ExperienceMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperienceMasterModelImplCopyWith<_$ExperienceMasterModelImpl>
      get copyWith => __$$ExperienceMasterModelImplCopyWithImpl<
          _$ExperienceMasterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperienceMasterModelImplToJson(
      this,
    );
  }
}

abstract class _ExperienceMasterModel implements ExperienceMasterModel {
  const factory _ExperienceMasterModel(
          {required final List<ExperienceModel> experiences}) =
      _$ExperienceMasterModelImpl;

  factory _ExperienceMasterModel.fromJson(Map<String, dynamic> json) =
      _$ExperienceMasterModelImpl.fromJson;

  @override
  List<ExperienceModel> get experiences;

  /// Create a copy of ExperienceMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperienceMasterModelImplCopyWith<_$ExperienceMasterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) {
  return _ExperienceModel.fromJson(json);
}

/// @nodoc
mixin _$ExperienceModel {
  String get employer => throw _privateConstructorUsedError;
  String get jobTitle => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this ExperienceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExperienceModelCopyWith<ExperienceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceModelCopyWith<$Res> {
  factory $ExperienceModelCopyWith(
          ExperienceModel value, $Res Function(ExperienceModel) then) =
      _$ExperienceModelCopyWithImpl<$Res, ExperienceModel>;
  @useResult
  $Res call(
      {String employer,
      String jobTitle,
      String location,
      String startDate,
      String endDate,
      String description});
}

/// @nodoc
class _$ExperienceModelCopyWithImpl<$Res, $Val extends ExperienceModel>
    implements $ExperienceModelCopyWith<$Res> {
  _$ExperienceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employer = null,
    Object? jobTitle = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      employer: null == employer
          ? _value.employer
          : employer // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExperienceModelImplCopyWith<$Res>
    implements $ExperienceModelCopyWith<$Res> {
  factory _$$ExperienceModelImplCopyWith(_$ExperienceModelImpl value,
          $Res Function(_$ExperienceModelImpl) then) =
      __$$ExperienceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String employer,
      String jobTitle,
      String location,
      String startDate,
      String endDate,
      String description});
}

/// @nodoc
class __$$ExperienceModelImplCopyWithImpl<$Res>
    extends _$ExperienceModelCopyWithImpl<$Res, _$ExperienceModelImpl>
    implements _$$ExperienceModelImplCopyWith<$Res> {
  __$$ExperienceModelImplCopyWithImpl(
      _$ExperienceModelImpl _value, $Res Function(_$ExperienceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employer = null,
    Object? jobTitle = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
  }) {
    return _then(_$ExperienceModelImpl(
      employer: null == employer
          ? _value.employer
          : employer // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperienceModelImpl implements _ExperienceModel {
  const _$ExperienceModelImpl(
      {required this.employer,
      required this.jobTitle,
      required this.location,
      required this.startDate,
      required this.endDate,
      required this.description});

  factory _$ExperienceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperienceModelImplFromJson(json);

  @override
  final String employer;
  @override
  final String jobTitle;
  @override
  final String location;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final String description;

  @override
  String toString() {
    return 'ExperienceModel(employer: $employer, jobTitle: $jobTitle, location: $location, startDate: $startDate, endDate: $endDate, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceModelImpl &&
            (identical(other.employer, employer) ||
                other.employer == employer) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, employer, jobTitle, location,
      startDate, endDate, description);

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperienceModelImplCopyWith<_$ExperienceModelImpl> get copyWith =>
      __$$ExperienceModelImplCopyWithImpl<_$ExperienceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperienceModelImplToJson(
      this,
    );
  }
}

abstract class _ExperienceModel implements ExperienceModel {
  const factory _ExperienceModel(
      {required final String employer,
      required final String jobTitle,
      required final String location,
      required final String startDate,
      required final String endDate,
      required final String description}) = _$ExperienceModelImpl;

  factory _ExperienceModel.fromJson(Map<String, dynamic> json) =
      _$ExperienceModelImpl.fromJson;

  @override
  String get employer;
  @override
  String get jobTitle;
  @override
  String get location;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String get description;

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperienceModelImplCopyWith<_$ExperienceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
