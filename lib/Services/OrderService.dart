import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
      RegionPoint4Lng) async {
    try {
      if (BudgetType == "54" && (Budget == null || Budget == "")) {
        throw Exception("Please fill in your Budget");
      }
      if (BudgetType == "55" && (Megawatt == null || Megawatt == "")) {
        throw Exception("Please fill in your Megawatt");
      }

      var param = <String, dynamic>{};
      param['EnergyType'] = int.parse(EnergyStorage);
      param['CustomerType'] = int.parse(CustomerType);
      param['BudgetType'] = int.parse(BudgetType);
      param['ElectricityGeneratedType'] =
          int.parse(EnergyStorage) == -1 ? null : int.parse(EnergyStorage);
      param['ConsumptionWatt'] = int.parse(ConsumptionWatt);
      param['Budget'] = int.parse(BudgetType) == 54 ? int.parse(Budget) : -1;
      param['Megawatt'] =
          int.parse(BudgetType) == 55 ? int.parse(Megawatt) : -1;
      param['Distance'] = int.parse(Distance);
      param['ElectricalTools'] = int.parse(ElectricalTools);
      param['EnergyStorage'] = int.parse(EnergyStorage);
      param['Lat'] = double.parse(Lat);
      param['Lng'] = double.parse(Lng);
      param['IsExact'] = IsExact;
      param['Description'] = Description;
      param['RegionPoint1Lat'] = RegionPoint1Lat;
      param['RegionPoint2Lat'] = RegionPoint2Lat;
      param['RegionPoint3Lat'] = RegionPoint3Lat;
      param['RegionPoint4Lat'] = RegionPoint4Lat;
      param['RegionPoint1Lng'] = RegionPoint1Lng;
      param['RegionPoint2Lng'] = RegionPoint2Lng;
      param['RegionPoint3Lng'] = RegionPoint3Lng;
      param['RegionPoint4Lng'] = RegionPoint4Lng;
      print(param);
      var response = await (await Api().dio).post('/User/SetOrder',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: json.encode(param));
      print(response);
      var baseModel = BaseModel.fromJson(response.data);
      await CommonFunctions.checkResponse(baseModel);
      var orderModel = baseModel.resultObject as int?;
      if (orderModel == null) {
        CommonFunctions.ShowMessage("No Product Found With This Specifications",
            context, MessageType.Error);
      }
      return Future.value(orderModel);
    } catch (e) {
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      return Future.value(null);
    }
  }

  Future<List<TrackingItemModel>> GetTrackingData() async {
    try {
      var response = await (await Api().dio).post('/User/GetProfile',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      print(response);
      var baseModel = BaseModel.fromJson(response.data);
      await CommonFunctions.checkResponse(baseModel);
      var trackingModel = TrackingModel.fromJson(
          baseModel.resultObject as Map<String, dynamic>);

      return Future.value(trackingModel.TrackingItems);
    } catch (e) {
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      return Future.value(null);
    }
  }
}
