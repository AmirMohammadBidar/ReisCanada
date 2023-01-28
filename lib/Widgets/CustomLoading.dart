import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLoading extends StatelessWidget {
  CustomLoading({Key? key}) : super(key: key);

  var isShow = false;
  @override
  Widget build(BuildContext context) {
    return Visibility(visible: isShow, child: CircularProgressIndicator());
  }
}
