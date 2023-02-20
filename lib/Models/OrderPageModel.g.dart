// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderPageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPageModel _$OrderPageModelFromJson(Map<String, dynamic> json) =>
    OrderPageModel(
      (json['energyType'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['customerType'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['electricityGeneratedType'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['budgetType'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderPageModelToJson(OrderPageModel instance) =>
    <String, dynamic>{
      'energyType': instance.energyType,
      'customerType': instance.customerType,
      'electricityGeneratedType': instance.electricityGeneratedType,
      'budgetType': instance.budgetType,
    };
