import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:reiscanada/Services/OrderService.dart';
import 'package:sizer/sizer.dart';

import '../Common/Common.dart';
import '../Models/TrackingItemModel.dart';
import '../Widgets/CustomDrawer.dart';
import '../Widgets/TopProfileBar.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  var borderStyleButtons = BorderSide(
      color: CommonFunctions.hexStringToColor("#43b79c"),
      width: 1,
      style: BorderStyle.none);
  var borderRadiosButtons = BorderRadius.circular(10);
  List<TrackingItemModel> trackingItems = <TrackingItemModel>[];

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: CommonFunctions.isShowing,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: CustomDrawer(),
        body: Container(
          color: CommonFunctions.hexStringToColor("#f0f0f0"),
          child: Column(children: <Widget>[
            /*Stack(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                HomePage.profileModel.fullName,
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
                                            color: CommonFunctions
                                                .hexStringToColor("#ededed")),
                                        Text(
                                          "Register from " +
                                              HomePage.profileModel.joinDate,
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
                */ /* Builder(
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
                ),*/ /*
              ],
            )*/
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
                        "Track Your Orders",
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
                        "You Can Track Your Orders here",
                        style:
                            TextStyle(color: Colors.black54, fontSize: 11.sp),
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
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          print("Clicked ${index}");
                        },
                        child: Card(
                            margin: EdgeInsets.only(
                                left: 5.w, right: 5.w, bottom: 2.h),
                            color: CommonFunctions.hexStringToColor("#f5f5f5"),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(trackingItems[index].productName),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Quantity :${trackingItems[index].quantity}",
                                          textAlign: TextAlign.left)),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Price :${trackingItems[index].price}")),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Order Number :${trackingItems[index].orderNo}")),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Order Status :${trackingItems[index].isDone ? "Purchased" : "Not Done"}")),
                                ],
                              ),
                            )),
                      ),
                      itemCount: trackingItems.length,
                    ),
                  )
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void initState() {
    OrderService(context).GetTrackingData().then((value) {
      setState(() {
        trackingItems = value;
        print(trackingItems);
      });
    });
  }
}
