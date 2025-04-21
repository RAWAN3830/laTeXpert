// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills_set_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SkillsSetState {
  List<SkillCategoryModel> get skillCategories =>
      throw _privateConstructorUsedError;

  /// Create a copy of SkillsSetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillsSetStateCopyWith<SkillsSetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillsSetStateCopyWith<$Res> {
  factory $SkillsSetStateCopyWith(
          SkillsSetState value, $Res Function(SkillsSetState) then) =
      _$SkillsSetStateCopyWithImpl<$Res, SkillsSetState>;
  @useResult
  $Res call({List<SkillCategoryModel> skillCategories});
}

/// @nodoc
class _$SkillsSetStateCopyWithImpl<$Res, $Val extends SkillsSetState>
    implements $SkillsSetStateCopyWith<$Res> {
  _$SkillsSetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillsSetState
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
abstract class _$$SkillsSetStateImplCopyWith<$Res>
    implements $SkillsSetStateCopyWith<$Res> {
  factory _$$SkillsSetStateImplCopyWith(_$SkillsSetStateImpl value,
          $Res Function(_$SkillsSetStateImpl) then) =
      __$$SkillsSetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SkillCategoryModel> skillCategories});
}

/// @nodoc
class __$$SkillsSetStateImplCopyWithImpl<$Res>
    extends _$SkillsSetStateCopyWithImpl<$Res, _$SkillsSetStateImpl>
    implements _$$SkillsSetStateImplCopyWith<$Res> {
  __$$SkillsSetStateImplCopyWithImpl(
      _$SkillsSetStateImpl _value, $Res Function(_$SkillsSetStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillsSetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillCategories = null,
  }) {
    return _then(_$SkillsSetStateImpl(
      skillCategories: null == skillCategories
          ? _value._skillCategories
          : skillCategories // ignore: cast_nullable_to_non_nullable
              as List<SkillCategoryModel>,
    ));
  }
}

/// @nodoc

class _$SkillsSetStateImpl implements _SkillsSetState {
  const _$SkillsSetStateImpl(
      {required final List<SkillCategoryModel> skillCategories})
      : _skillCategories = skillCategories;

  final List<SkillCategoryModel> _skillCategories;
  @override
  List<SkillCategoryModel> get skillCategories {
    if (_skillCategories is EqualUnmodifiableListView) return _skillCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skillCategories);
  }

  @override
  String toString() {
    return 'SkillsSetState(skillCategories: $skillCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsSetStateImpl &&
            const DeepCollectionEquality()
                .equals(other._skillCategories, _skillCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_skillCategories));

  /// Create a copy of SkillsSetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillsSetStateImplCopyWith<_$SkillsSetStateImpl> get copyWith =>
      __$$SkillsSetStateImplCopyWithImpl<_$SkillsSetStateImpl>(
          this, _$identity);
}

abstract class _SkillsSetState implements SkillsSetState {
  const factory _SkillsSetState(
          {required final List<SkillCategoryModel> skillCategories}) =
      _$SkillsSetStateImpl;

  @override
  List<SkillCategoryModel> get skillCategories;

  /// Create a copy of SkillsSetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillsSetStateImplCopyWith<_$SkillsSetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
