import 'package:flutter/material.dart';
import 'package:reiscanada/Common/Common.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(decoration: TextDecoration.none),
      child: Container(
        color: Colors.white70,
        child: Column(children: <Widget>[
          Container(
            height: 20.h,
            width: 100.w,
            color: Colors.white,
            child: Center(
              child: Container(
                height: 10.h,
                width: 70.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: CommonFunctions.hexStringToColor("#ededed"),
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
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
                                        "Amir Bidar",
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
                                  "Register from  1/3/2023 12:00:00 AM",
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
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10.w),
              color: Colors.white,
              child: Center(
                child: Text("asdas"),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
