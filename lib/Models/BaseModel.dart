import 'package:json_annotation/json_annotation.dart';

part 'BaseModel.g.dart';

@JsonSerializable()
class BaseModel {
  final bool isSuccess;
  final int statusCode;
  final String statusMessage;
  final Map<String, dynamic> resultObject;

  BaseModel(
      this.isSuccess, this.statusCode, this.statusMessage, this.resultObject);

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
