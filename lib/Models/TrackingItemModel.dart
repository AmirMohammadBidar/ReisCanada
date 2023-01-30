import 'package:json_annotation/json_annotation.dart';

part 'TrackingItemModel.g.dart';

@JsonSerializable()
class TrackingModel {
  final List<TrackingItemModel> TrackingItems;

  TrackingModel(this.TrackingItems);

  factory TrackingModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingModelToJson(this);
}

@JsonSerializable()
class TrackingItemModel {
  final bool isDone;
  final int orderId;
  final String orderNo;
  final double price;
  final String productName;
  final int quantity;

  TrackingItemModel(this.isDone, this.orderId, this.orderNo, this.price,
      this.productName, this.quantity);

  factory TrackingItemModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingItemModelToJson(this);
}
