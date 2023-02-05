import 'package:json_annotation/json_annotation.dart';

part 'OrderRequestModel.g.dart';

@JsonSerializable()
class OrderRequestModel {
  final int? res;

  OrderRequestModel(this.res);

  factory OrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestModelToJson(this);
}
