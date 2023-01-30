// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrackingItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingModel _$TrackingModelFromJson(Map<String, dynamic> json) =>
    TrackingModel(
      (json['TrackingItems'] as List<dynamic>)
          .map((e) => TrackingItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackingModelToJson(TrackingModel instance) =>
    <String, dynamic>{
      'TrackingItems': instance.TrackingItems,
    };

TrackingItemModel _$TrackingItemModelFromJson(Map<String, dynamic> json) =>
    TrackingItemModel(
      json['isDone'] as bool,
      json['orderId'] as int,
      json['orderNo'] as String,
      (json['price'] as num).toDouble(),
      json['productName'] as String,
      json['quantity'] as int,
    );

Map<String, dynamic> _$TrackingItemModelToJson(TrackingItemModel instance) =>
    <String, dynamic>{
      'isDone': instance.isDone,
      'orderId': instance.orderId,
      'orderNo': instance.orderNo,
      'price': instance.price,
      'productName': instance.productName,
      'quantity': instance.quantity,
    };
