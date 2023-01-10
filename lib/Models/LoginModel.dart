import 'package:json_annotation/json_annotation.dart';

part 'LoginModel.g.dart';

@JsonSerializable()
class LoginModel {
  final int userId;
  final String token;

  LoginModel(this.userId, this.token);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
