import 'package:flutter/material.dart';
import 'package:reiscanada/Common/Common.dart';
import 'package:sizer/sizer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: CommonFunctions.hexStringToColor("#03a9f4"),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: CommonFunctions.hexStringToColor("#03a9f4"),
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(15))),
            child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Image.asset(
                      "assets/images/ReisLogoTran.png",
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Reis Future Canada",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Renewable Energy Intelligent Solution",
                          maxLines: 1,
                          style: TextStyle(fontSize: 7.sp, color: Colors.white),
                        )
                      ],
                    ),
                  )
                ]),
          ),
          ListTile(
            title: Flex(direction: Axis.horizontal, children: <Widget>[]),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
