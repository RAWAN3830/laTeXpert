// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonalInfoModel _$PersonalInfoModelFromJson(Map<String, dynamic> json) {
  return _PersonalInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PersonalInfoModel {
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get jobTitle => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<Links> get links => throw _privateConstructorUsedError;

  /// Serializes this PersonalInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalInfoModelCopyWith<PersonalInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInfoModelCopyWith<$Res> {
  factory $PersonalInfoModelCopyWith(
          PersonalInfoModel value, $Res Function(PersonalInfoModel) then) =
      _$PersonalInfoModelCopyWithImpl<$Res, PersonalInfoModel>;
  @useResult
  $Res call(
      {String firstname,
      String lastname,
      String email,
      String phone,
      String jobTitle,
      String address,
      List<Links> links});
}

/// @nodoc
class _$PersonalInfoModelCopyWithImpl<$Res, $Val extends PersonalInfoModel>
    implements $PersonalInfoModelCopyWith<$Res> {
  _$PersonalInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
    Object? email = null,
    Object? phone = null,
    Object? jobTitle = null,
    Object? address = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Links>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalInfoModelImplCopyWith<$Res>
    implements $PersonalInfoModelCopyWith<$Res> {
  factory _$$PersonalInfoModelImplCopyWith(_$PersonalInfoModelImpl value,
          $Res Function(_$PersonalInfoModelImpl) then) =
      __$$PersonalInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstname,
      String lastname,
      String email,
      String phone,
      String jobTitle,
      String address,
      List<Links> links});
}

/// @nodoc
class __$$PersonalInfoModelImplCopyWithImpl<$Res>
    extends _$PersonalInfoModelCopyWithImpl<$Res, _$PersonalInfoModelImpl>
    implements _$$PersonalInfoModelImplCopyWith<$Res> {
  __$$PersonalInfoModelImplCopyWithImpl(_$PersonalInfoModelImpl _value,
      $Res Function(_$PersonalInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonalInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
    Object? email = null,
    Object? phone = null,
    Object? jobTitle = null,
    Object? address = null,
    Object? links = null,
  }) {
    return _then(_$PersonalInfoModelImpl(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Links>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalInfoModelImpl implements _PersonalInfoModel {
  const _$PersonalInfoModelImpl(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.jobTitle,
      required this.address,
      required final List<Links> links})
      : _links = links;

  factory _$PersonalInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalInfoModelImplFromJson(json);

  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String jobTitle;
  @override
  final String address;
  final List<Links> _links;
  @override
  List<Links> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'PersonalInfoModel(firstname: $firstname, lastname: $lastname, email: $email, phone: $phone, jobTitle: $jobTitle, address: $address, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalInfoModelImpl &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstname, lastname, email,
      phone, jobTitle, address, const DeepCollectionEquality().hash(_links));

  /// Create a copy of PersonalInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalInfoModelImplCopyWith<_$PersonalInfoModelImpl> get copyWith =>
      __$$PersonalInfoModelImplCopyWithImpl<_$PersonalInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalInfoModelImplToJson(
      this,
    );
  }
}

abstract class _PersonalInfoModel implements PersonalInfoModel {
  const factory _PersonalInfoModel(
      {required final String firstname,
      required final String lastname,
      required final String email,
      required final String phone,
      required final String jobTitle,
      required final String address,
      required final List<Links> links}) = _$PersonalInfoModelImpl;

  factory _PersonalInfoModel.fromJson(Map<String, dynamic> json) =
      _$PersonalInfoModelImpl.fromJson;

  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get jobTitle;
  @override
  String get address;
  @override
  List<Links> get links;

  /// Create a copy of PersonalInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalInfoModelImplCopyWith<_$PersonalInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Links _$LinksFromJson(Map<String, dynamic> json) {
  return _Links.fromJson(json);
}

/// @nodoc
mixin _$Links {
  String get name => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  /// Serializes this Links to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinksCopyWith<Links> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksCopyWith<$Res> {
  factory $LinksCopyWith(Links value, $Res Function(Links) then) =
      _$LinksCopyWithImpl<$Res, Links>;
  @useResult
  $Res call({String name, String link});
}

/// @nodoc
class _$LinksCopyWithImpl<$Res, $Val extends Links>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinksImplCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$$LinksImplCopyWith(
          _$LinksImpl value, $Res Function(_$LinksImpl) then) =
      __$$LinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String link});
}

/// @nodoc
class __$$LinksImplCopyWithImpl<$Res>
    extends _$LinksCopyWithImpl<$Res, _$LinksImpl>
    implements _$$LinksImplCopyWith<$Res> {
  __$$LinksImplCopyWithImpl(
      _$LinksImpl _value, $Res Function(_$LinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? link = null,
  }) {
    return _then(_$LinksImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinksImpl implements _Links {
  const _$LinksImpl({required this.name, required this.link});

  factory _$LinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksImplFromJson(json);

  @override
  final String name;
  @override
  final String link;

  @override
  String toString() {
    return 'Links(name: $name, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinksImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, link);

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      __$$LinksImplCopyWithImpl<_$LinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinksImplToJson(
      this,
    );
  }
}

abstract class _Links implements Links {
  const factory _Links(
      {required final String name, required final String link}) = _$LinksImpl;

  factory _Links.fromJson(Map<String, dynamic> json) = _$LinksImpl.fromJson;

  @override
  String get name;
  @override
  String get link;

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
