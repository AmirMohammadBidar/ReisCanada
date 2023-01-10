// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
      json['isSuccess'] as bool,
      json['statusCode'] as int,
      json['statusMessage'] as String,
      json['resultObject'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'resultObject': instance.resultObject,
    };
