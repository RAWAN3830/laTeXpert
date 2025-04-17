// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AchievementState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AchievementInfoModel> achievementList)
        success,
    required TResult Function(String errorMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AchievementInfoModel> achievementList)? success,
    TResult? Function(String errorMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AchievementInfoModel> achievementList)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AchievementStateInitial value) initial,
    required TResult Function(AchievementStateLoading value) loading,
    required TResult Function(AchievementStateSuccess value) success,
    required TResult Function(AchievementStateError value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AchievementStateInitial value)? initial,
    TResult? Function(AchievementStateLoading value)? loading,
    TResult? Function(AchievementStateSuccess value)? success,
    TResult? Function(AchievementStateError value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AchievementStateInitial value)? initial,
    TResult Function(AchievementStateLoading value)? loading,
    TResult Function(AchievementStateSuccess value)? success,
    TResult Function(AchievementStateError value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementStateCopyWith<$Res> {
  factory $AchievementStateCopyWith(
          AchievementState value, $Res Function(AchievementState) then) =
      _$AchievementStateCopyWithImpl<$Res, AchievementState>;
}

/// @nodoc
class _$AchievementStateCopyWithImpl<$Res, $Val extends AchievementState>
    implements $AchievementStateCopyWith<$Res> {
  _$AchievementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AchievementStateInitialImplCopyWith<$Res> {
  factory _$$AchievementStateInitialImplCopyWith(
          _$AchievementStateInitialImpl value,
          $Res Function(_$AchievementStateInitialImpl) then) =
      __$$AchievementStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AchievementStateInitialImplCopyWithImpl<$Res>
    extends _$AchievementStateCopyWithImpl<$Res, _$AchievementStateInitialImpl>
    implements _$$AchievementStateInitialImplCopyWith<$Res> {
  __$$AchievementStateInitialImplCopyWithImpl(
      _$AchievementStateInitialImpl _value,
      $Res Function(_$AchievementStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AchievementStateInitialImpl implements AchievementStateInitial {
  const _$AchievementStateInitialImpl();

  @override
  String toString() {
    return 'AchievementState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AchievementInfoModel> achievementList)
        success,
    required TResult Function(String errorMessage) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AchievementInfoModel> achievementList)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AchievementInfoModel> achievementList)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AchievementStateInitial value) initial,
    required TResult Function(AchievementStateLoading value) loading,
    required TResult Function(AchievementStateSuccess value) success,
    required TResult Function(AchievementStateError value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AchievementStateInitial value)? initial,
    TResult? Function(AchievementStateLoading value)? loading,
    TResult? Function(AchievementStateSuccess value)? success,
    TResult? Function(AchievementStateError value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AchievementStateInitial value)? initial,
    TResult Function(AchievementStateLoading value)? loading,
    TResult Function(AchievementStateSuccess value)? success,
    TResult Function(AchievementStateError value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AchievementStateInitial implements AchievementState {
  const factory AchievementStateInitial() = _$AchievementStateInitialImpl;
}

/// @nodoc
abstract class _$$AchievementStateLoadingImplCopyWith<$Res> {
  factory _$$AchievementStateLoadingImplCopyWith(
          _$AchievementStateLoadingImpl value,
          $Res Function(_$AchievementStateLoadingImpl) then) =
      __$$AchievementStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AchievementStateLoadingImplCopyWithImpl<$Res>
    extends _$AchievementStateCopyWithImpl<$Res, _$AchievementStateLoadingImpl>
    implements _$$AchievementStateLoadingImplCopyWith<$Res> {
  __$$AchievementStateLoadingImplCopyWithImpl(
      _$AchievementStateLoadingImpl _value,
      $Res Function(_$AchievementStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AchievementStateLoadingImpl implements AchievementStateLoading {
  const _$AchievementStateLoadingImpl();

  @override
  String toString() {
    return 'AchievementState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AchievementInfoModel> achievementList)
        success,
    required TResult Function(String errorMessage) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AchievementInfoModel> achievementList)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AchievementInfoModel> achievementList)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AchievementStateInitial value) initial,
    required TResult Function(AchievementStateLoading value) loading,
    required TResult Function(AchievementStateSuccess value) success,
    required TResult Function(AchievementStateError value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AchievementStateInitial value)? initial,
    TResult? Function(AchievementStateLoading value)? loading,
    TResult? Function(AchievementStateSuccess value)? success,
    TResult? Function(AchievementStateError value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AchievementStateInitial value)? initial,
    TResult Function(AchievementStateLoading value)? loading,
    TResult Function(AchievementStateSuccess value)? success,
    TResult Function(AchievementStateError value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AchievementStateLoading implements AchievementState {
  const factory AchievementStateLoading() = _$AchievementStateLoadingImpl;
}

/// @nodoc
abstract class _$$AchievementStateSuccessImplCopyWith<$Res> {
  factory _$$AchievementStateSuccessImplCopyWith(
          _$AchievementStateSuccessImpl value,
          $Res Function(_$AchievementStateSuccessImpl) then) =
      __$$AchievementStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AchievementInfoModel> achievementList});
}

/// @nodoc
class __$$AchievementStateSuccessImplCopyWithImpl<$Res>
    extends _$AchievementStateCopyWithImpl<$Res, _$AchievementStateSuccessImpl>
    implements _$$AchievementStateSuccessImplCopyWith<$Res> {
  __$$AchievementStateSuccessImplCopyWithImpl(
      _$AchievementStateSuccessImpl _value,
      $Res Function(_$AchievementStateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementList = null,
  }) {
    return _then(_$AchievementStateSuccessImpl(
      achievementList: null == achievementList
          ? _value._achievementList
          : achievementList // ignore: cast_nullable_to_non_nullable
              as List<AchievementInfoModel>,
    ));
  }
}

/// @nodoc

class _$AchievementStateSuccessImpl implements AchievementStateSuccess {
  const _$AchievementStateSuccessImpl(
      {required final List<AchievementInfoModel> achievementList})
      : _achievementList = achievementList;

  final List<AchievementInfoModel> _achievementList;
  @override
  List<AchievementInfoModel> get achievementList {
    if (_achievementList is EqualUnmodifiableListView) return _achievementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievementList);
  }

  @override
  String toString() {
    return 'AchievementState.success(achievementList: $achievementList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementStateSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._achievementList, _achievementList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_achievementList));

  /// Create a copy of AchievementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementStateSuccessImplCopyWith<_$AchievementStateSuccessImpl>
      get copyWith => __$$AchievementStateSuccessImplCopyWithImpl<
          _$AchievementStateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AchievementInfoModel> achievementList)
        success,
    required TResult Function(String errorMessage) failure,
  }) {
    return success(achievementList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AchievementInfoModel> achievementList)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return success?.call(achievementList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AchievementInfoModel> achievementList)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(achievementList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AchievementStateInitial value) initial,
    required TResult Function(AchievementStateLoading value) loading,
    required TResult Function(AchievementStateSuccess value) success,
    required TResult Function(AchievementStateError value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AchievementStateInitial value)? initial,
    TResult? Function(AchievementStateLoading value)? loading,
    TResult? Function(AchievementStateSuccess value)? success,
    TResult? Function(AchievementStateError value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AchievementStateInitial value)? initial,
    TResult Function(AchievementStateLoading value)? loading,
    TResult Function(AchievementStateSuccess value)? success,
    TResult Function(AchievementStateError value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AchievementStateSuccess implements AchievementState {
  const factory AchievementStateSuccess(
          {required final List<AchievementInfoModel> achievementList}) =
      _$AchievementStateSuccessImpl;

  List<AchievementInfoModel> get achievementList;

  /// Create a copy of AchievementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementStateSuccessImplCopyWith<_$AchievementStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AchievementStateErrorImplCopyWith<$Res> {
  factory _$$AchievementStateErrorImplCopyWith(
          _$AchievementStateErrorImpl value,
          $Res Function(_$AchievementStateErrorImpl) then) =
      __$$AchievementStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$AchievementStateErrorImplCopyWithImpl<$Res>
    extends _$AchievementStateCopyWithImpl<$Res, _$AchievementStateErrorImpl>
    implements _$$AchievementStateErrorImplCopyWith<$Res> {
  __$$AchievementStateErrorImplCopyWithImpl(_$AchievementStateErrorImpl _value,
      $Res Function(_$AchievementStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$AchievementStateErrorImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AchievementStateErrorImpl implements AchievementStateError {
  const _$AchievementStateErrorImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AchievementState.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementStateErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of AchievementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementStateErrorImplCopyWith<_$AchievementStateErrorImpl>
      get copyWith => __$$AchievementStateErrorImplCopyWithImpl<
          _$AchievementStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AchievementInfoModel> achievementList)
        success,
    required TResult Function(String errorMessage) failure,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AchievementInfoModel> achievementList)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AchievementInfoModel> achievementList)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AchievementStateInitial value) initial,
    required TResult Function(AchievementStateLoading value) loading,
    required TResult Function(AchievementStateSuccess value) success,
    required TResult Function(AchievementStateError value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AchievementStateInitial value)? initial,
    TResult? Function(AchievementStateLoading value)? loading,
    TResult? Function(AchievementStateSuccess value)? success,
    TResult? Function(AchievementStateError value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AchievementStateInitial value)? initial,
    TResult Function(AchievementStateLoading value)? loading,
    TResult Function(AchievementStateSuccess value)? success,
    TResult Function(AchievementStateError value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AchievementStateError implements AchievementState {
  const factory AchievementStateError({required final String errorMessage}) =
      _$AchievementStateErrorImpl;

  String get errorMessage;

  /// Create a copy of AchievementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementStateErrorImplCopyWith<_$AchievementStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
