// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectInfoModel> projectList) success,
    required TResult Function(String errorMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectInfoModel> projectList)? success,
    TResult? Function(String errorMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectInfoModel> projectList)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectStateInitial value) initial,
    required TResult Function(ProjectStateLoading value) loading,
    required TResult Function(ProjectStateSuccess value) success,
    required TResult Function(ProjectStateError value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectStateInitial value)? initial,
    TResult? Function(ProjectStateLoading value)? loading,
    TResult? Function(ProjectStateSuccess value)? success,
    TResult? Function(ProjectStateError value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectStateInitial value)? initial,
    TResult Function(ProjectStateLoading value)? loading,
    TResult Function(ProjectStateSuccess value)? success,
    TResult Function(ProjectStateError value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStateCopyWith<$Res> {
  factory $ProjectStateCopyWith(
          ProjectState value, $Res Function(ProjectState) then) =
      _$ProjectStateCopyWithImpl<$Res, ProjectState>;
}

/// @nodoc
class _$ProjectStateCopyWithImpl<$Res, $Val extends ProjectState>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProjectStateInitialImplCopyWith<$Res> {
  factory _$$ProjectStateInitialImplCopyWith(_$ProjectStateInitialImpl value,
          $Res Function(_$ProjectStateInitialImpl) then) =
      __$$ProjectStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectStateInitialImplCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$ProjectStateInitialImpl>
    implements _$$ProjectStateInitialImplCopyWith<$Res> {
  __$$ProjectStateInitialImplCopyWithImpl(_$ProjectStateInitialImpl _value,
      $Res Function(_$ProjectStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProjectStateInitialImpl implements ProjectStateInitial {
  const _$ProjectStateInitialImpl();

  @override
  String toString() {
    return 'ProjectState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectInfoModel> projectList) success,
    required TResult Function(String errorMessage) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectInfoModel> projectList)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectInfoModel> projectList)? success,
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
    required TResult Function(ProjectStateInitial value) initial,
    required TResult Function(ProjectStateLoading value) loading,
    required TResult Function(ProjectStateSuccess value) success,
    required TResult Function(ProjectStateError value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectStateInitial value)? initial,
    TResult? Function(ProjectStateLoading value)? loading,
    TResult? Function(ProjectStateSuccess value)? success,
    TResult? Function(ProjectStateError value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectStateInitial value)? initial,
    TResult Function(ProjectStateLoading value)? loading,
    TResult Function(ProjectStateSuccess value)? success,
    TResult Function(ProjectStateError value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProjectStateInitial implements ProjectState {
  const factory ProjectStateInitial() = _$ProjectStateInitialImpl;
}

/// @nodoc
abstract class _$$ProjectStateLoadingImplCopyWith<$Res> {
  factory _$$ProjectStateLoadingImplCopyWith(_$ProjectStateLoadingImpl value,
          $Res Function(_$ProjectStateLoadingImpl) then) =
      __$$ProjectStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectStateLoadingImplCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$ProjectStateLoadingImpl>
    implements _$$ProjectStateLoadingImplCopyWith<$Res> {
  __$$ProjectStateLoadingImplCopyWithImpl(_$ProjectStateLoadingImpl _value,
      $Res Function(_$ProjectStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProjectStateLoadingImpl implements ProjectStateLoading {
  const _$ProjectStateLoadingImpl();

  @override
  String toString() {
    return 'ProjectState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectInfoModel> projectList) success,
    required TResult Function(String errorMessage) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectInfoModel> projectList)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectInfoModel> projectList)? success,
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
    required TResult Function(ProjectStateInitial value) initial,
    required TResult Function(ProjectStateLoading value) loading,
    required TResult Function(ProjectStateSuccess value) success,
    required TResult Function(ProjectStateError value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectStateInitial value)? initial,
    TResult? Function(ProjectStateLoading value)? loading,
    TResult? Function(ProjectStateSuccess value)? success,
    TResult? Function(ProjectStateError value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectStateInitial value)? initial,
    TResult Function(ProjectStateLoading value)? loading,
    TResult Function(ProjectStateSuccess value)? success,
    TResult Function(ProjectStateError value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProjectStateLoading implements ProjectState {
  const factory ProjectStateLoading() = _$ProjectStateLoadingImpl;
}

/// @nodoc
abstract class _$$ProjectStateSuccessImplCopyWith<$Res> {
  factory _$$ProjectStateSuccessImplCopyWith(_$ProjectStateSuccessImpl value,
          $Res Function(_$ProjectStateSuccessImpl) then) =
      __$$ProjectStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProjectInfoModel> projectList});
}

/// @nodoc
class __$$ProjectStateSuccessImplCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$ProjectStateSuccessImpl>
    implements _$$ProjectStateSuccessImplCopyWith<$Res> {
  __$$ProjectStateSuccessImplCopyWithImpl(_$ProjectStateSuccessImpl _value,
      $Res Function(_$ProjectStateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectList = null,
  }) {
    return _then(_$ProjectStateSuccessImpl(
      projectList: null == projectList
          ? _value._projectList
          : projectList // ignore: cast_nullable_to_non_nullable
              as List<ProjectInfoModel>,
    ));
  }
}

/// @nodoc

class _$ProjectStateSuccessImpl implements ProjectStateSuccess {
  const _$ProjectStateSuccessImpl(
      {required final List<ProjectInfoModel> projectList})
      : _projectList = projectList;

  final List<ProjectInfoModel> _projectList;
  @override
  List<ProjectInfoModel> get projectList {
    if (_projectList is EqualUnmodifiableListView) return _projectList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectList);
  }

  @override
  String toString() {
    return 'ProjectState.success(projectList: $projectList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStateSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._projectList, _projectList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_projectList));

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectStateSuccessImplCopyWith<_$ProjectStateSuccessImpl> get copyWith =>
      __$$ProjectStateSuccessImplCopyWithImpl<_$ProjectStateSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectInfoModel> projectList) success,
    required TResult Function(String errorMessage) failure,
  }) {
    return success(projectList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectInfoModel> projectList)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return success?.call(projectList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectInfoModel> projectList)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(projectList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectStateInitial value) initial,
    required TResult Function(ProjectStateLoading value) loading,
    required TResult Function(ProjectStateSuccess value) success,
    required TResult Function(ProjectStateError value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectStateInitial value)? initial,
    TResult? Function(ProjectStateLoading value)? loading,
    TResult? Function(ProjectStateSuccess value)? success,
    TResult? Function(ProjectStateError value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectStateInitial value)? initial,
    TResult Function(ProjectStateLoading value)? loading,
    TResult Function(ProjectStateSuccess value)? success,
    TResult Function(ProjectStateError value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ProjectStateSuccess implements ProjectState {
  const factory ProjectStateSuccess(
          {required final List<ProjectInfoModel> projectList}) =
      _$ProjectStateSuccessImpl;

  List<ProjectInfoModel> get projectList;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectStateSuccessImplCopyWith<_$ProjectStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectStateErrorImplCopyWith<$Res> {
  factory _$$ProjectStateErrorImplCopyWith(_$ProjectStateErrorImpl value,
          $Res Function(_$ProjectStateErrorImpl) then) =
      __$$ProjectStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ProjectStateErrorImplCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$ProjectStateErrorImpl>
    implements _$$ProjectStateErrorImplCopyWith<$Res> {
  __$$ProjectStateErrorImplCopyWithImpl(_$ProjectStateErrorImpl _value,
      $Res Function(_$ProjectStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ProjectStateErrorImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectStateErrorImpl implements ProjectStateError {
  const _$ProjectStateErrorImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ProjectState.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStateErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectStateErrorImplCopyWith<_$ProjectStateErrorImpl> get copyWith =>
      __$$ProjectStateErrorImplCopyWithImpl<_$ProjectStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectInfoModel> projectList) success,
    required TResult Function(String errorMessage) failure,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectInfoModel> projectList)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectInfoModel> projectList)? success,
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
    required TResult Function(ProjectStateInitial value) initial,
    required TResult Function(ProjectStateLoading value) loading,
    required TResult Function(ProjectStateSuccess value) success,
    required TResult Function(ProjectStateError value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectStateInitial value)? initial,
    TResult? Function(ProjectStateLoading value)? loading,
    TResult? Function(ProjectStateSuccess value)? success,
    TResult? Function(ProjectStateError value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectStateInitial value)? initial,
    TResult Function(ProjectStateLoading value)? loading,
    TResult Function(ProjectStateSuccess value)? success,
    TResult Function(ProjectStateError value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ProjectStateError implements ProjectState {
  const factory ProjectStateError({required final String errorMessage}) =
      _$ProjectStateErrorImpl;

  String get errorMessage;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectStateErrorImplCopyWith<_$ProjectStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
