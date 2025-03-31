// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AchievementMasterModel _$AchievementMasterModelFromJson(
    Map<String, dynamic> json) {
  return _AchievementMasterModel.fromJson(json);
}

/// @nodoc
mixin _$AchievementMasterModel {
  List<AchievementInfoModel> get achievements =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchievementMasterModelCopyWith<AchievementMasterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementMasterModelCopyWith<$Res> {
  factory $AchievementMasterModelCopyWith(AchievementMasterModel value,
          $Res Function(AchievementMasterModel) then) =
      _$AchievementMasterModelCopyWithImpl<$Res, AchievementMasterModel>;
  @useResult
  $Res call({List<AchievementInfoModel> achievements});
}

/// @nodoc
class _$AchievementMasterModelCopyWithImpl<$Res,
        $Val extends AchievementMasterModel>
    implements $AchievementMasterModelCopyWith<$Res> {
  _$AchievementMasterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievements = null,
  }) {
    return _then(_value.copyWith(
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<AchievementInfoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementMasterModelImplCopyWith<$Res>
    implements $AchievementMasterModelCopyWith<$Res> {
  factory _$$AchievementMasterModelImplCopyWith(
          _$AchievementMasterModelImpl value,
          $Res Function(_$AchievementMasterModelImpl) then) =
      __$$AchievementMasterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AchievementInfoModel> achievements});
}

/// @nodoc
class __$$AchievementMasterModelImplCopyWithImpl<$Res>
    extends _$AchievementMasterModelCopyWithImpl<$Res,
        _$AchievementMasterModelImpl>
    implements _$$AchievementMasterModelImplCopyWith<$Res> {
  __$$AchievementMasterModelImplCopyWithImpl(
      _$AchievementMasterModelImpl _value,
      $Res Function(_$AchievementMasterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievements = null,
  }) {
    return _then(_$AchievementMasterModelImpl(
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<AchievementInfoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementMasterModelImpl implements _AchievementMasterModel {
  const _$AchievementMasterModelImpl(
      {required final List<AchievementInfoModel> achievements})
      : _achievements = achievements;

  factory _$AchievementMasterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementMasterModelImplFromJson(json);

  final List<AchievementInfoModel> _achievements;
  @override
  List<AchievementInfoModel> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  String toString() {
    return 'AchievementMasterModel(achievements: $achievements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementMasterModelImpl &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_achievements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementMasterModelImplCopyWith<_$AchievementMasterModelImpl>
      get copyWith => __$$AchievementMasterModelImplCopyWithImpl<
          _$AchievementMasterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementMasterModelImplToJson(
      this,
    );
  }
}

abstract class _AchievementMasterModel implements AchievementMasterModel {
  const factory _AchievementMasterModel(
          {required final List<AchievementInfoModel> achievements}) =
      _$AchievementMasterModelImpl;

  factory _AchievementMasterModel.fromJson(Map<String, dynamic> json) =
      _$AchievementMasterModelImpl.fromJson;

  @override
  List<AchievementInfoModel> get achievements;
  @override
  @JsonKey(ignore: true)
  _$$AchievementMasterModelImplCopyWith<_$AchievementMasterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AchievementInfoModel _$AchievementInfoModelFromJson(Map<String, dynamic> json) {
  return _AchievementInfoModel.fromJson(json);
}

/// @nodoc
mixin _$AchievementInfoModel {
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get issuer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchievementInfoModelCopyWith<AchievementInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementInfoModelCopyWith<$Res> {
  factory $AchievementInfoModelCopyWith(AchievementInfoModel value,
          $Res Function(AchievementInfoModel) then) =
      _$AchievementInfoModelCopyWithImpl<$Res, AchievementInfoModel>;
  @useResult
  $Res call({String title, String link, String issuer});
}

/// @nodoc
class _$AchievementInfoModelCopyWithImpl<$Res,
        $Val extends AchievementInfoModel>
    implements $AchievementInfoModelCopyWith<$Res> {
  _$AchievementInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
    Object? issuer = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementInfoModelImplCopyWith<$Res>
    implements $AchievementInfoModelCopyWith<$Res> {
  factory _$$AchievementInfoModelImplCopyWith(_$AchievementInfoModelImpl value,
          $Res Function(_$AchievementInfoModelImpl) then) =
      __$$AchievementInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String link, String issuer});
}

/// @nodoc
class __$$AchievementInfoModelImplCopyWithImpl<$Res>
    extends _$AchievementInfoModelCopyWithImpl<$Res, _$AchievementInfoModelImpl>
    implements _$$AchievementInfoModelImplCopyWith<$Res> {
  __$$AchievementInfoModelImplCopyWithImpl(_$AchievementInfoModelImpl _value,
      $Res Function(_$AchievementInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
    Object? issuer = null,
  }) {
    return _then(_$AchievementInfoModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementInfoModelImpl implements _AchievementInfoModel {
  const _$AchievementInfoModelImpl(
      {required this.title, required this.link, required this.issuer});

  factory _$AchievementInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementInfoModelImplFromJson(json);

  @override
  final String title;
  @override
  final String link;
  @override
  final String issuer;

  @override
  String toString() {
    return 'AchievementInfoModel(title: $title, link: $link, issuer: $issuer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementInfoModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.issuer, issuer) || other.issuer == issuer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, link, issuer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementInfoModelImplCopyWith<_$AchievementInfoModelImpl>
      get copyWith =>
          __$$AchievementInfoModelImplCopyWithImpl<_$AchievementInfoModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementInfoModelImplToJson(
      this,
    );
  }
}

abstract class _AchievementInfoModel implements AchievementInfoModel {
  const factory _AchievementInfoModel(
      {required final String title,
      required final String link,
      required final String issuer}) = _$AchievementInfoModelImpl;

  factory _AchievementInfoModel.fromJson(Map<String, dynamic> json) =
      _$AchievementInfoModelImpl.fromJson;

  @override
  String get title;
  @override
  String get link;
  @override
  String get issuer;
  @override
  @JsonKey(ignore: true)
  _$$AchievementInfoModelImplCopyWith<_$AchievementInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
