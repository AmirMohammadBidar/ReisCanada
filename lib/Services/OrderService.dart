import 'package:flutter/material.dart';

class OrderService {
  static OrderService? _instance;
  BuildContext context;

  factory OrderService(BuildContext context) =>
      _instance ??= OrderService._(context);

  OrderService._(this.context);

  /* Future<List<BaseModel>> GetListCategory(){

  }*/
}
