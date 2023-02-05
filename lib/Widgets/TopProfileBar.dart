import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Common/Common.dart';
import '../Screens/HomePage.dart';
import '../Screens/ProfilePage.dart';

class TopProfilebar extends StatefulWidget {
  bool isProfilePage = false;

  TopProfilebar({Key? key, this.isProfilePage = false}) : super(key: key);

  @override
  State<TopProfilebar> createState() => _TopProfilebarState(isProfilePage);
}

class _TopProfilebarState extends State<TopProfilebar> {
  bool isProfilePage = false;

  _TopProfilebarState(this.isProfilePage);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isProfilePage) return;
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const ProfilePage();
          },
        ));
      },
      child: Stack(
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
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          HomePage.profileModel!.fullName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.blue,
                                              fontSize: 13.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                      height: 3,
                                      color: CommonFunctions.hexStringToColor(
                                          "#ededed")),
                                  Text(
                                    "Register from ${HomePage.profileModel!.joinDate}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 8.sp),
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image.asset('assets/images/profile_male.png',
                              width: 13.w),
                        )
                      ]),
                ),
              ),
            ),
          ),
          /*Builder(
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
    );
  }
}
