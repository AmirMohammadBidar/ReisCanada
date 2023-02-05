// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      json['id'] as int,
      json['fullName'] as String,
      json['companyName'] as String,
      json['email'] as String,
      json['joinDate'] as String,
      json['userType'] as int,
      json['firstName'] as String,
      json['lastName'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'companyName': instance.companyName,
      'email': instance.email,
      'joinDate': instance.joinDate,
      'userType': instance.userType,
    };
