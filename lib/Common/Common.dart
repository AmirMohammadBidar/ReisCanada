import 'package:flutter/material.dart';
import 'package:reiscanada/Models/BaseModel.dart';

import '../Enum/enums.dart';

class CommonFunctions {
  static void ShowMessage(
      String message, BuildContext buildContext, MessageType messsageType) {
    Color? color;
    if (messsageType == MessageType.Success) {
      color = Colors.green;
    }
    if (messsageType == MessageType.Error) {
      color = Colors.redAccent;
    }

    ScaffoldMessenger.of(buildContext).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  static hexStringToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static Future<void> checkResponse(BaseModel baseModel) async {
    if (baseModel == null) {
      throw Exception(
          "There is a problem communicating with server , Please try again");
    }
    if (!baseModel.isSuccess) {
      throw Exception(baseModel.statusMessage);
    }
  }
}
