// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experiences_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExperienceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ExperienceMasterModel experienceMasterModel)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ExperienceMasterModel experienceMasterModel)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ExperienceMasterModel experienceMasterModel)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExperienceStateInitial value) initial,
    required TResult Function(ExperienceStateSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExperienceStateInitial value)? initial,
    TResult? Function(ExperienceStateSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExperienceStateInitial value)? initial,
    TResult Function(ExperienceStateSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceStateCopyWith<$Res> {
  factory $ExperienceStateCopyWith(
          ExperienceState value, $Res Function(ExperienceState) then) =
      _$ExperienceStateCopyWithImpl<$Res, ExperienceState>;
}

/// @nodoc
class _$ExperienceStateCopyWithImpl<$Res, $Val extends ExperienceState>
    implements $ExperienceStateCopyWith<$Res> {
  _$ExperienceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ExperienceStateInitialImplCopyWith<$Res> {
  factory _$$ExperienceStateInitialImplCopyWith(
          _$ExperienceStateInitialImpl value,
          $Res Function(_$ExperienceStateInitialImpl) then) =
      __$$ExperienceStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExperienceStateInitialImplCopyWithImpl<$Res>
    extends _$ExperienceStateCopyWithImpl<$Res, _$ExperienceStateInitialImpl>
    implements _$$ExperienceStateInitialImplCopyWith<$Res> {
  __$$ExperienceStateInitialImplCopyWithImpl(
      _$ExperienceStateInitialImpl _value,
      $Res Function(_$ExperienceStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ExperienceStateInitialImpl implements ExperienceStateInitial {
  const _$ExperienceStateInitialImpl();

  @override
  String toString() {
    return 'ExperienceState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ExperienceMasterModel experienceMasterModel)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ExperienceMasterModel experienceMasterModel)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ExperienceMasterModel experienceMasterModel)? success,
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
    required TResult Function(ExperienceStateInitial value) initial,
    required TResult Function(ExperienceStateSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExperienceStateInitial value)? initial,
    TResult? Function(ExperienceStateSuccess value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExperienceStateInitial value)? initial,
    TResult Function(ExperienceStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ExperienceStateInitial implements ExperienceState {
  const factory ExperienceStateInitial() = _$ExperienceStateInitialImpl;
}

/// @nodoc
abstract class _$$ExperienceStateSuccessImplCopyWith<$Res> {
  factory _$$ExperienceStateSuccessImplCopyWith(
          _$ExperienceStateSuccessImpl value,
          $Res Function(_$ExperienceStateSuccessImpl) then) =
      __$$ExperienceStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ExperienceMasterModel experienceMasterModel});

  $ExperienceMasterModelCopyWith<$Res> get experienceMasterModel;
}

/// @nodoc
class __$$ExperienceStateSuccessImplCopyWithImpl<$Res>
    extends _$ExperienceStateCopyWithImpl<$Res, _$ExperienceStateSuccessImpl>
    implements _$$ExperienceStateSuccessImplCopyWith<$Res> {
  __$$ExperienceStateSuccessImplCopyWithImpl(
      _$ExperienceStateSuccessImpl _value,
      $Res Function(_$ExperienceStateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experienceMasterModel = null,
  }) {
    return _then(_$ExperienceStateSuccessImpl(
      experienceMasterModel: null == experienceMasterModel
          ? _value.experienceMasterModel
          : experienceMasterModel // ignore: cast_nullable_to_non_nullable
              as ExperienceMasterModel,
    ));
  }

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExperienceMasterModelCopyWith<$Res> get experienceMasterModel {
    return $ExperienceMasterModelCopyWith<$Res>(_value.experienceMasterModel,
        (value) {
      return _then(_value.copyWith(experienceMasterModel: value));
    });
  }
}

/// @nodoc

class _$ExperienceStateSuccessImpl implements ExperienceStateSuccess {
  const _$ExperienceStateSuccessImpl({required this.experienceMasterModel});

  @override
  final ExperienceMasterModel experienceMasterModel;

  @override
  String toString() {
    return 'ExperienceState.success(experienceMasterModel: $experienceMasterModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceStateSuccessImpl &&
            (identical(other.experienceMasterModel, experienceMasterModel) ||
                other.experienceMasterModel == experienceMasterModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, experienceMasterModel);

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperienceStateSuccessImplCopyWith<_$ExperienceStateSuccessImpl>
      get copyWith => __$$ExperienceStateSuccessImplCopyWithImpl<
          _$ExperienceStateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ExperienceMasterModel experienceMasterModel)
        success,
  }) {
    return success(experienceMasterModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ExperienceMasterModel experienceMasterModel)? success,
  }) {
    return success?.call(experienceMasterModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ExperienceMasterModel experienceMasterModel)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(experienceMasterModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExperienceStateInitial value) initial,
    required TResult Function(ExperienceStateSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExperienceStateInitial value)? initial,
    TResult? Function(ExperienceStateSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExperienceStateInitial value)? initial,
    TResult Function(ExperienceStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ExperienceStateSuccess implements ExperienceState {
  const factory ExperienceStateSuccess(
          {required final ExperienceMasterModel experienceMasterModel}) =
      _$ExperienceStateSuccessImpl;

  ExperienceMasterModel get experienceMasterModel;

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperienceStateSuccessImplCopyWith<_$ExperienceStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
