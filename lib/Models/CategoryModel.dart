import 'package:json_annotation/json_annotation.dart';

part 'CategoryModel.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String title;
  final String parentId;

  CategoryModel(this.id, this.title, this.parentId);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryModelRes {
  final List<CategoryModel> Categories;

  CategoryModelRes(this.Categories);

  factory CategoryModelRes.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelResFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelResToJson(this);
}
