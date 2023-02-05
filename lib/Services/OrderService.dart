import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reiscanada/Models/OrderRequestModel.dart';
import 'package:reiscanada/Models/TrackingItemModel.dart';

import '../Common/Common.dart';
import '../Data/Dio.dart';
import '../Enum/enums.dart';
import '../Models/BaseModel.dart';

class OrderService {
  static OrderService? _instance;
  BuildContext context;

  factory OrderService(BuildContext context) =>
      _instance ??= OrderService._(context);

  OrderService._(this.context);

  Future<int?> SetOrder(
      int EnergyType,
      int CustomerType,
      int BudgetType,
      int ElectricityGeneratedType,
      int ConsumptionWatt,
      int? Budget,
      int? Megawatt,
      int Distance,
      int ElectricalTools,
      int EnergyStorage,
      double Lat,
      double Lng,
      bool IsExact,
      String Description,
      double RegionPoint1Lat,
      double RegionPoint2Lat,
      double RegionPoint3Lat,
      double RegionPoint4Lat,
      double RegionPoint1Lng,
      double RegionPoint2Lng,
      double RegionPoint3Lng,
      double RegionPoint4Lng) async {
    try {
      if (BudgetType == 54 && (Budget == null || Budget == "")) {
        throw Exception("Please fill in your Budget");
      }
      if (BudgetType == 55 && (Megawatt == null || Megawatt == "")) {
        throw Exception("Please fill in your Megawatt");
      }

      print(EnergyType);
      print(CustomerType);
      print(BudgetType);
      print(ElectricityGeneratedType);
      print(ConsumptionWatt);
      print(Budget);
      print(Megawatt);
      print(Distance);
      print(ElectricalTools);
      print(EnergyStorage);
      print(Lat);
      print(Lng);
      print(IsExact);
      print(Description);
      print(RegionPoint1Lat);
      print(RegionPoint2Lat);
      print(RegionPoint3Lat);
      print(RegionPoint4Lat);
      print(RegionPoint1Lng);
      print(RegionPoint2Lng);
      print(RegionPoint3Lng);
      print(RegionPoint4Lng);

      var param = <String, dynamic>{
        'EnergyType': EnergyStorage,
        'CustomerType': CustomerType,
        'BudgetType': BudgetType,
        'ElectricityGeneratedType': EnergyStorage == -1 ? null : EnergyStorage,
        'ConsumptionWatt': ConsumptionWatt,
        'Budget': BudgetType == 54 ? Budget : -1,
        'Megawatt': BudgetType == 55 ? Megawatt : -1,
        'Distance': Distance,
        'ElectricalTools': ElectricalTools,
        'EnergyStorage': EnergyStorage,
        'Lat': Lat,
        'Lng': Lng,
        'IsExact': IsExact,
        'Description': Description,
        'RegionPoint1Lat': RegionPoint1Lat,
        'RegionPoint2Lat': RegionPoint2Lat,
        'RegionPoint3Lat': RegionPoint3Lat,
        'RegionPoint4Lat': RegionPoint4Lat,
        'RegionPoint1Lng': RegionPoint1Lng,
        'RegionPoint2Lng': RegionPoint2Lng,
        'RegionPoint3Lng': RegionPoint3Lng,
        'RegionPoint4Lng': RegionPoint4Lng
      };
      /* param['EnergyType'] = EnergyStorage;
      param['CustomerType'] = CustomerType;
      param['BudgetType'] = BudgetType;
      param['ElectricityGeneratedType'] =
          EnergyStorage == -1 ? null : EnergyStorage;
      param['ConsumptionWatt'] = ConsumptionWatt;
      param['Budget'] = BudgetType == 54 ? Budget : -1;
      param['Megawatt'] = BudgetType == 55 ? Megawatt : -1;
      param['Distance'] = Distance;
      param['ElectricalTools'] = ElectricalTools;
      param['EnergyStorage'] = EnergyStorage;
      param['Lat'] = Lat;
      param['Lng'] = Lng;
      param['IsExact'] = IsExact;
      param['Description'] = Description;
      param['RegionPoint1Lat'] = RegionPoint1Lat;
      param['RegionPoint2Lat'] = RegionPoint2Lat;
      param['RegionPoint3Lat'] = RegionPoint3Lat;
      param['RegionPoint4Lat'] = RegionPoint4Lat;
      param['RegionPoint1Lng'] = RegionPoint1Lng;
      param['RegionPoint2Lng'] = RegionPoint2Lng;
      param['RegionPoint3Lng'] = RegionPoint3Lng;
      param['RegionPoint4Lng'] = RegionPoint4Lng;*/
      print(json.encode(param));
      var response = await (await Api().dio).post('/User/SetOrder',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: json.encode(param));
      print(response);
      var baseModel = BaseModel.fromJson(response.data);
      await CommonFunctions.checkResponse(baseModel);
      var orderModel = OrderRequestModel.fromJson(
          baseModel.resultObject as Map<String, dynamic>);
      if (orderModel.res == null) {
        CommonFunctions.ShowMessage("No Product Found With This Specifications",
            context, MessageType.Error);
      }
      return Future.value(orderModel.res);
    } catch (e) {
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      return Future.value(null);
    }
  }

  Future<List<TrackingItemModel>> GetTrackingData() async {
    try {
      var response = await (await Api().dio).post('/User/GetProducts',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      var baseModel = BaseModel.fromJson(response.data);
      print(baseModel.resultObject);
      await CommonFunctions.checkResponse(baseModel);
      var trackingModel = TrackingModel.fromJson(
          baseModel.resultObject as Map<String, dynamic>);
      print("2");
      return Future.value(trackingModel.trackingItems);
    } catch (e) {
      print(e);
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      return Future.value(<TrackingItemModel>[]);
    }
  }
}
