import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:reiscanada/Common/Common.dart';
import 'package:reiscanada/Models/ProfileModel.dart';
import 'package:reiscanada/Screens/RequestPage.dart';
import 'package:reiscanada/Screens/TrackingPage.dart';
import 'package:reiscanada/Widgets/TopProfileBar.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/CustomDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static ProfileModel? profileModel;

  @override
  Widget build(BuildContext context) {
    var borderStyleButtons = BorderSide(
        color: CommonFunctions.hexStringToColor("#43b79c"),
        width: 1,
        style: BorderStyle.none);
    var borderRadiosButtons = BorderRadius.circular(10);

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: CustomDrawer(),
      body: Container(
        color: CommonFunctions.hexStringToColor("#f0f0f0"),
        child: Column(children: <Widget>[
          TopProfilebar(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5.w),
              color: Colors.white,
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 2.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome To ReisCanada",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 1.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "You can Review a summary of our purpose here",
                      style: TextStyle(color: Colors.black54, fontSize: 11.sp),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    height: 1,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 4.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: min(41.w, 200),
                          height: min(14.w, 80),
                          child: ElevatedButton(
                              onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RequestPage()))
                                  },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: borderRadiosButtons),
                                  side: borderStyleButtons),
                              child: Text("Add New Request",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 11.sp, color: Colors.white))),
                        ),
                        SizedBox(
                          width: min(41.w, 200),
                          height: min(14.w, 80),
                          child: ElevatedButton(
                              onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TrackingPage()))
                                  },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      CommonFunctions.hexStringToColor(
                                          "#43b79c"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: borderRadiosButtons,
                                      side: BorderSide(
                                          color:
                                              CommonFunctions.hexStringToColor(
                                                  "#43b79c")))),
                              child: Text("Track your Requests",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.white))),
                        )
                      ]),
                ),
                Center(
                  child: CarouselSlider(
                    options: CarouselOptions(height: 300.0),
                    items: ["CEll.jpg", "renewable-energy.jpg", "Untitled.png"]
                        .map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(),
                              child: Image.asset('assets/images/$i'));
                        },
                      );
                    }).toList(),
                  ),
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
