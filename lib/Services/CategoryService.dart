import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:reiscanada/Enum/enums.dart';
import 'package:reiscanada/Models/CategoryModel.dart';

import '../Common/Common.dart';
import '../Data/Dio.dart';
import '../Models/BaseModel.dart';

class CategoryService {
  static CategoryService? _instance;
  BuildContext context;

  factory CategoryService(BuildContext context) =>
      _instance ?? CategoryService._(context);

  CategoryService._(this.context);

  Future<List<dynamic>> GetCategory(int Id) async {
    try {
      if (Id <= 0) {
        throw Exception("Please send valid category Id");
      }
      var param = <String, dynamic>{};
      param['Id'] = Id;

      var response = await (await Api().dio).post('/User/GetCategory',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: json.encode(param));
      var baseModel = BaseModel.fromJson(response.data);
      print(baseModel.resultObject);
      await CommonFunctions.checkResponse(baseModel);
      print(baseModel.resultObject as List<dynamic>);
      return baseModel.resultObject as List<dynamic>;
    } catch (e) {
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      return <CategoryModel>[];
    }
  }
}
