import 'package:flutter/material.dart';
import 'package:reiscanada/Models/BaseModel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Enum/enums.dart';

class CommonFunctions {
  static bool isShowing = false;

  static void ShowMessage(
      String message, BuildContext buildContext, MessageType messsageType) {
    Color? color;
    if (messsageType == MessageType.Success) {
      color = Colors.green;
    }
    if (messsageType == MessageType.Error) {
      color = Colors.redAccent;
    }
    Navigator.of(buildContext).setState(() {
      isShowing = false;
    });
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

  static showAlertDialog(BuildContext context, String Title, String Description,
      Function OkFunction) {
    // set up the buttons

    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        OkFunction();
      },
    );
    // set up the AlertDialog

    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(Title),
      content: Text(Description),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void LaunchEmailSubmission(
      BuildContext context, path, subject, body) async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: path,
        queryParameters: {'subject': subject, 'body': body});
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      CommonFunctions.ShowMessage(
          "Unable to open email app", context, MessageType.Error);
    }
  }
}

extension NavigatorStateExtension on NavigatorState {
  void pushNamedIfNotCurrent(String routeName, {required Object arguments}) {
    if (!isCurrent(routeName)) {
      pushNamed(routeName, arguments: arguments);
    }
  }

  bool isCurrent(String routeName) {
    bool isCurrent = false;
    popUntil((route) {
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });
    return isCurrent;
  }
}
