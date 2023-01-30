import 'package:json_annotation/json_annotation.dart';

part 'ProfileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  final int id;
  final String fullName;
  final String companyName;
  final String email;
  final String joinDate;

  ProfileModel(
      this.id, this.fullName, this.companyName, this.email, this.joinDate);

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
