import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:reiscanada/Common/Common.dart';
import 'package:reiscanada/Screens/RequestPage.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/CustomDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          Stack(
            children: <Widget>[
              Container(
                height: 20.h,
                width: 100.w,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: (3.h + 5)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 10.h,
                      width: 80.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: CommonFunctions.hexStringToColor("#ededed"),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Welcome ",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 13.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                          Flexible(
                                            child: Text(
                                              "Mrs Ahmadzadeh",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.blue,
                                                  fontSize: 13.sp),
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(
                                          height: 3,
                                          color:
                                              CommonFunctions.hexStringToColor(
                                                  "#ededed")),
                                      Text(
                                        "Register from  1/3/2023 12:00:00 AM",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 8.sp),
                                      ),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Image.asset(
                                  'assets/images/profile_male.png',
                                  width: 13.w),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
              /* Builder(
                builder: (buildContext) => Positioned(
                  top: 35,
                  left: 20,
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Scaffold.of(buildContext).openDrawer();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("assets/images/HamburgerIcon.png",
                            width: 40.0, height: 30.0),
                      ),
                    ),
                  ),
                ),
              ),*/
            ],
          ),
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
                              onPressed: () => {},
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
