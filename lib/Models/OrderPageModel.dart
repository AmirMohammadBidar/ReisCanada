import 'package:json_annotation/json_annotation.dart';
import 'package:reiscanada/Models/CategoryModel.dart';

part 'OrderPageModel.g.dart';

@JsonSerializable()
class OrderPageModel {
  List<CategoryModel> energyType;
  List<CategoryModel> customerType;
  List<CategoryModel> electricityGeneratedType;
  List<CategoryModel> budgetType;

  OrderPageModel(this.energyType, this.customerType,
      this.electricityGeneratedType, this.budgetType);

  factory OrderPageModel.fromJson(Map<String, dynamic> json) =>
      _$OrderPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPageModelToJson(this);
}
