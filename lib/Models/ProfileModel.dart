import 'package:json_annotation/json_annotation.dart';

part 'ProfileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  final int id;
  final String fullName;
  final String firstName;
  final String lastName;
  final String companyName;
  final String email;
  final String joinDate;
  final int userType;

  ProfileModel(this.id, this.fullName, this.companyName, this.email,
      this.joinDate, this.userType, this.firstName, this.lastName);

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
