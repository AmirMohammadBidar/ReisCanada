import 'package:flutter/material.dart';

import '../Common/Common.dart';
import '../Enum/enums.dart';

class OrderService {
  static OrderService? _instance;
  BuildContext context;

  factory OrderService(BuildContext context) =>
      _instance ??= OrderService._(context);

  OrderService._(this.context);

  /* Future<List<BaseModel>> GetListCategory(){

  }*/

  Future<bool> SetOrder(
      EnergyType,
      CustomerType,
      BudgetType,
      ElectricityGeneratedType,
      ConsumptionWatt,
      Budget,
      Megawatt,
      Distance,
      ElectricalTools,
      EnergyStorage,
      Lat,
      Lng,
      IsExact,
      Description,
      RegionPoint1Lat,
      RegionPoint2Lat,
      RegionPoint3Lat,
      RegionPoint4Lat,
      RegionPoint1Lng,
      RegionPoint2Lng,
      RegionPoint3Lng,
      RegionPoint4Lng) {
    try {
      if (BudgetType == "54" && (Budget == null || Budget == "")) {
        throw Exception("Please fill in your Budget");
      }
      if (BudgetType == "55" && (Megawatt == null || Megawatt == "")) {
        throw Exception("Please fill in your Megawatt");
      }
      /*var param = <String, dynamic>{};
      param['UserName'] = userName;
      param['Password'] = password;
      print(param);
      var response = await Api().dio.post('/User/LoginUser',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: json.encode(param));
      print(response);
      var baseModel = BaseModel.fromJson(response.data);
      await CommonFunctions.checkResponse(baseModel);
      var loginModel = baseModel.resultObject as LoginModel;
      SharedPreferencesHelper.setToken(loginModel.token);
      SharedPreferencesHelper.setUserId(loginModel.userId);
      return true;*/
      return Future.value(true);
    } catch (e) {
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      return Future.value(false);
    }
  }
}
