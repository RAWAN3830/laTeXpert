// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalInfoModelImpl _$$PersonalInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalInfoModelImpl(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      jobTitle: json['jobTitle'] as String,
      address: json['address'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => Links.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PersonalInfoModelImplToJson(
        _$PersonalInfoModelImpl instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
      'jobTitle': instance.jobTitle,
      'address': instance.address,
      'links': instance.links,
    };

_$LinksImpl _$$LinksImplFromJson(Map<String, dynamic> json) => _$LinksImpl(
      name: json['name'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$$LinksImplToJson(_$LinksImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'link': instance.link,
    };
