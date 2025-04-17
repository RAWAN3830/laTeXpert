// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'final_resume_model_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinalResumeModelClass _$FinalResumeModelClassFromJson(
    Map<String, dynamic> json) {
  return _FinalResumeModelClass.fromJson(json);
}

/// @nodoc
mixin _$FinalResumeModelClass {
  AchievementMasterModel get achievements => throw _privateConstructorUsedError;
  DeclarationMasterModel get declarations => throw _privateConstructorUsedError;
  EducationMasterModel get education => throw _privateConstructorUsedError;
  ExperienceMasterModel get experience => throw _privateConstructorUsedError;
  PersonalInfoModel get personalInfo => throw _privateConstructorUsedError;
  ProjectMasterModel get projects => throw _privateConstructorUsedError;
  SkillCategoryMasterModel get skills => throw _privateConstructorUsedError;

  /// Serializes this FinalResumeModelClass to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinalResumeModelClassCopyWith<FinalResumeModelClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinalResumeModelClassCopyWith<$Res> {
  factory $FinalResumeModelClassCopyWith(FinalResumeModelClass value,
          $Res Function(FinalResumeModelClass) then) =
      _$FinalResumeModelClassCopyWithImpl<$Res, FinalResumeModelClass>;
  @useResult
  $Res call(
      {AchievementMasterModel achievements,
      DeclarationMasterModel declarations,
      EducationMasterModel education,
      ExperienceMasterModel experience,
      PersonalInfoModel personalInfo,
      ProjectMasterModel projects,
      SkillCategoryMasterModel skills});

  $AchievementMasterModelCopyWith<$Res> get achievements;
  $DeclarationMasterModelCopyWith<$Res> get declarations;
  $EducationMasterModelCopyWith<$Res> get education;
  $ExperienceMasterModelCopyWith<$Res> get experience;
  $PersonalInfoModelCopyWith<$Res> get personalInfo;
  $ProjectMasterModelCopyWith<$Res> get projects;
  $SkillCategoryMasterModelCopyWith<$Res> get skills;
}

/// @nodoc
class _$FinalResumeModelClassCopyWithImpl<$Res,
        $Val extends FinalResumeModelClass>
    implements $FinalResumeModelClassCopyWith<$Res> {
  _$FinalResumeModelClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievements = null,
    Object? declarations = null,
    Object? education = null,
    Object? experience = null,
    Object? personalInfo = null,
    Object? projects = null,
    Object? skills = null,
  }) {
    return _then(_value.copyWith(
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as AchievementMasterModel,
      declarations: null == declarations
          ? _value.declarations
          : declarations // ignore: cast_nullable_to_non_nullable
              as DeclarationMasterModel,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as EducationMasterModel,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as ExperienceMasterModel,
      personalInfo: null == personalInfo
          ? _value.personalInfo
          : personalInfo // ignore: cast_nullable_to_non_nullable
              as PersonalInfoModel,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as ProjectMasterModel,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as SkillCategoryMasterModel,
    ) as $Val);
  }

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AchievementMasterModelCopyWith<$Res> get achievements {
    return $AchievementMasterModelCopyWith<$Res>(_value.achievements, (value) {
      return _then(_value.copyWith(achievements: value) as $Val);
    });
  }

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeclarationMasterModelCopyWith<$Res> get declarations {
    return $DeclarationMasterModelCopyWith<$Res>(_value.declarations, (value) {
      return _then(_value.copyWith(declarations: value) as $Val);
    });
  }

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EducationMasterModelCopyWith<$Res> get education {
    return $EducationMasterModelCopyWith<$Res>(_value.education, (value) {
      return _then(_value.copyWith(education: value) as $Val);
    });
  }

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExperienceMasterModelCopyWith<$Res> get experience {
    return $ExperienceMasterModelCopyWith<$Res>(_value.experience, (value) {
      return _then(_value.copyWith(experience: value) as $Val);
    });
  }

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalInfoModelCopyWith<$Res> get personalInfo {
    return $PersonalInfoModelCopyWith<$Res>(_value.personalInfo, (value) {
      return _then(_value.copyWith(personalInfo: value) as $Val);
    });
  }

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectMasterModelCopyWith<$Res> get projects {
    return $ProjectMasterModelCopyWith<$Res>(_value.projects, (value) {
      return _then(_value.copyWith(projects: value) as $Val);
    });
  }

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SkillCategoryMasterModelCopyWith<$Res> get skills {
    return $SkillCategoryMasterModelCopyWith<$Res>(_value.skills, (value) {
      return _then(_value.copyWith(skills: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FinalResumeModelClassImplCopyWith<$Res>
    implements $FinalResumeModelClassCopyWith<$Res> {
  factory _$$FinalResumeModelClassImplCopyWith(
          _$FinalResumeModelClassImpl value,
          $Res Function(_$FinalResumeModelClassImpl) then) =
      __$$FinalResumeModelClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AchievementMasterModel achievements,
      DeclarationMasterModel declarations,
      EducationMasterModel education,
      ExperienceMasterModel experience,
      PersonalInfoModel personalInfo,
      ProjectMasterModel projects,
      SkillCategoryMasterModel skills});

  @override
  $AchievementMasterModelCopyWith<$Res> get achievements;
  @override
  $DeclarationMasterModelCopyWith<$Res> get declarations;
  @override
  $EducationMasterModelCopyWith<$Res> get education;
  @override
  $ExperienceMasterModelCopyWith<$Res> get experience;
  @override
  $PersonalInfoModelCopyWith<$Res> get personalInfo;
  @override
  $ProjectMasterModelCopyWith<$Res> get projects;
  @override
  $SkillCategoryMasterModelCopyWith<$Res> get skills;
}

/// @nodoc
class __$$FinalResumeModelClassImplCopyWithImpl<$Res>
    extends _$FinalResumeModelClassCopyWithImpl<$Res,
        _$FinalResumeModelClassImpl>
    implements _$$FinalResumeModelClassImplCopyWith<$Res> {
  __$$FinalResumeModelClassImplCopyWithImpl(_$FinalResumeModelClassImpl _value,
      $Res Function(_$FinalResumeModelClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievements = null,
    Object? declarations = null,
    Object? education = null,
    Object? experience = null,
    Object? personalInfo = null,
    Object? projects = null,
    Object? skills = null,
  }) {
    return _then(_$FinalResumeModelClassImpl(
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as AchievementMasterModel,
      declarations: null == declarations
          ? _value.declarations
          : declarations // ignore: cast_nullable_to_non_nullable
              as DeclarationMasterModel,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as EducationMasterModel,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as ExperienceMasterModel,
      personalInfo: null == personalInfo
          ? _value.personalInfo
          : personalInfo // ignore: cast_nullable_to_non_nullable
              as PersonalInfoModel,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as ProjectMasterModel,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as SkillCategoryMasterModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinalResumeModelClassImpl implements _FinalResumeModelClass {
  const _$FinalResumeModelClassImpl(
      {required this.achievements,
      required this.declarations,
      required this.education,
      required this.experience,
      required this.personalInfo,
      required this.projects,
      required this.skills});

  factory _$FinalResumeModelClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinalResumeModelClassImplFromJson(json);

  @override
  final AchievementMasterModel achievements;
  @override
  final DeclarationMasterModel declarations;
  @override
  final EducationMasterModel education;
  @override
  final ExperienceMasterModel experience;
  @override
  final PersonalInfoModel personalInfo;
  @override
  final ProjectMasterModel projects;
  @override
  final SkillCategoryMasterModel skills;

  @override
  String toString() {
    return 'FinalResumeModelClass(achievements: $achievements, declarations: $declarations, education: $education, experience: $experience, personalInfo: $personalInfo, projects: $projects, skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinalResumeModelClassImpl &&
            (identical(other.achievements, achievements) ||
                other.achievements == achievements) &&
            (identical(other.declarations, declarations) ||
                other.declarations == declarations) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.personalInfo, personalInfo) ||
                other.personalInfo == personalInfo) &&
            (identical(other.projects, projects) ||
                other.projects == projects) &&
            (identical(other.skills, skills) || other.skills == skills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, achievements, declarations,
      education, experience, personalInfo, projects, skills);

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinalResumeModelClassImplCopyWith<_$FinalResumeModelClassImpl>
      get copyWith => __$$FinalResumeModelClassImplCopyWithImpl<
          _$FinalResumeModelClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinalResumeModelClassImplToJson(
      this,
    );
  }
}

abstract class _FinalResumeModelClass implements FinalResumeModelClass {
  const factory _FinalResumeModelClass(
          {required final AchievementMasterModel achievements,
          required final DeclarationMasterModel declarations,
          required final EducationMasterModel education,
          required final ExperienceMasterModel experience,
          required final PersonalInfoModel personalInfo,
          required final ProjectMasterModel projects,
          required final SkillCategoryMasterModel skills}) =
      _$FinalResumeModelClassImpl;

  factory _FinalResumeModelClass.fromJson(Map<String, dynamic> json) =
      _$FinalResumeModelClassImpl.fromJson;

  @override
  AchievementMasterModel get achievements;
  @override
  DeclarationMasterModel get declarations;
  @override
  EducationMasterModel get education;
  @override
  ExperienceMasterModel get experience;
  @override
  PersonalInfoModel get personalInfo;
  @override
  ProjectMasterModel get projects;
  @override
  SkillCategoryMasterModel get skills;

  /// Create a copy of FinalResumeModelClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinalResumeModelClassImplCopyWith<_$FinalResumeModelClassImpl>
      get copyWith => throw _privateConstructorUsedError;
}
