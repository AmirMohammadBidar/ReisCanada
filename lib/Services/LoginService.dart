import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reiscanada/Common/Common.dart';
import 'package:reiscanada/Common/SharedPreferenceHelper.dart';
import 'package:reiscanada/Enum/enums.dart';
import 'package:reiscanada/Models/ProfileModel.dart';
import 'package:reiscanada/Screens/HomePage.dart';
import 'package:reiscanada/Screens/LoginPage.dart';

import '../Data/Dio.dart';
import '../Models/BaseModel.dart';
import '../Models/LoginModel.dart';

class LoginService {
  static LoginService? _instance;
  BuildContext context;

  factory LoginService(BuildContext context) =>
      _instance ??= LoginService._(context);

  LoginService._(this.context);

  Future<bool> RegisterUser(
      int customerType,
      String firstName,
      String lastName,
      String organizationName,
      String email,
      String Password,
      bool receiveNews) async {
    try {
      bool isOrganizationsValid = false;
      for (var li in Organizations.values) {
        if (li.value == customerType) {
          isOrganizationsValid = true;
          break;
        }
      }
      if (!isOrganizationsValid) {
        throw Exception("Chosen organization is not valid");
      }
      if (firstName.isEmpty) {
        throw Exception("Please fill in your first name");
      }
      if (lastName.isEmpty) {
        throw Exception("Please fill in your last name");
      }
      if (email.isEmpty ||
          !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(email)) {
        throw Exception("Please enter a valid email");
      }
      var param = <String, dynamic>{};
      param['CustomerType'] = customerType;
      param['FirstName'] = firstName;
      param['LastName'] = lastName;
      param['OrganizationName'] = organizationName;
      param['Email'] = email;
      param['Password'] = Password;
      param['ReceiveNews'] = receiveNews;
      var response = await (await Api().dio).post('/User/RegisterUser',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: json.encode(param));
      var baseModel = BaseModel.fromJson(response.data);
      await CommonFunctions.checkResponse(baseModel);
      var loginModel =
          LoginModel.fromJson(baseModel.resultObject as Map<String, dynamic>);
      SharedPreferencesHelper.setToken(loginModel.token);
      SharedPreferencesHelper.setUserId(loginModel.userId);
      return Future.value(true);
    } catch (e) {
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      return Future.value(false);
    }
  }

  Future<bool> SignIn(String userName, String password) async {
    try {
      if (userName.isEmpty) {
        throw Exception("Please fill in you user name");
      }
      if (password.isEmpty) {
        throw Exception("Please fill in your password");
      }

      var param = <String, dynamic>{};
      param['UserName'] = userName;
      param['Password'] = password;
      var response = await (await Api().dio).post('/User/LoginUser',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: json.encode(param));
      var baseModel = BaseModel.fromJson(response.data);
      await CommonFunctions.checkResponse(baseModel);
      var loginModel =
          LoginModel.fromJson(baseModel.resultObject as Map<String, dynamic>);
      await SharedPreferencesHelper.setToken(loginModel.token);
      await SharedPreferencesHelper.setUserId(loginModel.userId);
      await GetProfile(false);
      return Future.value(true);
    } catch (e) {
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      return Future.value(false);
    }
  }

  Future<void> GetProfile(bool Redirect) async {
    try {
      var response = await (await Api().dio).post('/User/GetProfile',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      print(response);
      var baseModel = BaseModel.fromJson(response.data);
      await CommonFunctions.checkResponse(baseModel);
      var profileModel =
          ProfileModel.fromJson(baseModel.resultObject as Map<String, dynamic>);
      HomePage.profileModel = profileModel;
    } catch (e) {
      print(e);
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      if (Redirect) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        });
      }
    }
  }

  Future<bool> ChangeProfile(String email, String firstName, String lastName,
      String companyName, int userType) async {
    try {
      var param = <String, dynamic>{};
      param['Email'] = email;
      param['CustomerType'] = userType;
      param['FirstName'] = firstName;
      param['LastName'] = lastName;
      param['OrganizationName'] = companyName;
      var response = await (await Api().dio).post('/User/ChangeProfile',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: param);

      var baseModel = BaseModel.fromJson(response.data);

      await CommonFunctions.checkResponse(baseModel);

      var profileModel =
          ProfileModel.fromJson(baseModel.resultObject as Map<String, dynamic>);
      HomePage.profileModel = profileModel;
      return Future.value(true);
    } catch (e) {
      CommonFunctions.ShowMessage(e.toString().replaceAll("Exception:", ""),
          context, MessageType.Error);
      return Future.value(false);
    }
  }
}
