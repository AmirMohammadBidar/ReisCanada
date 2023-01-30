import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:reiscanada/Screens/HomePage.dart';
import 'package:sizer/sizer.dart';

import '../Common/Common.dart';
import '../Services/OrderService.dart';
import '../Widgets/CustomDrawer.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  var borderStyleButtons = BorderSide(
      color: CommonFunctions.hexStringToColor("#43b79c"),
      width: 1,
      style: BorderStyle.none);
  var borderRadiosButtons = BorderRadius.circular(10);
  var formDivider = const Divider(color: Colors.transparent, height: 15);

  List<DropdownMenuItem<String>> get dropdownItemsEnergyType {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Photovoltaic Energy"), value: "27"),
      const DropdownMenuItem(child: Text("CSP"), value: "28"),
      const DropdownMenuItem(child: Text("Wind Energy Onshore"), value: "29"),
      const DropdownMenuItem(child: Text("Wind Energy Offshore"), value: "30"),
      const DropdownMenuItem(child: Text("Hydroelectric Energy"), value: "31"),
      const DropdownMenuItem(child: Text("Geothermal Energy"), value: "32"),
      const DropdownMenuItem(
          child: Text("Biomass and Biogas Energy"), value: "33"),
      const DropdownMenuItem(
          child: Text("Ocean Energy Wave Power"), value: "34"),
      const DropdownMenuItem(
          child: Text("Ocean Energy Water Flow"), value: "35"),
      const DropdownMenuItem(child: Text("Water Flow Tide"), value: "36"),
    ];
    return menuItems;
  }

  var EnergyType = "";

  List<DropdownMenuItem<String>> get dropdownItemsCustomerType {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Residential"), value: "38"),
      const DropdownMenuItem(child: Text("Corporate"), value: "39"),
      const DropdownMenuItem(child: Text("Schools and Colleges"), value: "40"),
      const DropdownMenuItem(child: Text("Estate / Farm House"), value: "41"),
      const DropdownMenuItem(child: Text("Government"), value: "42"),
      const DropdownMenuItem(child: Text("SMEs"), value: "43")
    ];
    return menuItems;
  }

  var CustomerType = "";

  List<DropdownMenuItem<String>> get dropdownItemsGeneratedElectricityType {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "-1",
          child: Text(
              overflow: TextOverflow.ellipsis,
              "Select Your Generated Electricity Type")),
      const DropdownMenuItem(child: Text("Sell"), value: "45"),
      const DropdownMenuItem(child: Text("Save"), value: "46"),
      const DropdownMenuItem(child: Text("Consumption"), value: "47"),
      const DropdownMenuItem(child: Text("Sell And Save"), value: "48"),
      const DropdownMenuItem(child: Text("Cryptocurrency"), value: "49")
    ];
    return menuItems;
  }

  var GeneratedElectricityType = "";

  List<DropdownMenuItem<String>> get dropdownItemsBudgetType {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "54", child: Text("Distinguish")),
      const DropdownMenuItem(value: "55", child: Text("NotDistinguish"))
    ];
    return menuItems;
  }

  var BudgetType = "";

  List<DropdownMenuItem<String>> get dropdownItemsEnergyStorage {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Yes"), value: "1"),
      const DropdownMenuItem(child: Text("No"), value: "0")
    ];
    return menuItems;
  }

  var EnergyStorage = "";

  final TextEditingController KwController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController ConsumptionController = TextEditingController();
  final TextEditingController NElecToolsController = TextEditingController();
  final TextEditingController KWController = TextEditingController();
  final TextEditingController DescriptionController = TextEditingController();

  bool MapType = true;

  bool DistinguishType = true;

  var mapController = MapController();

  var _latitude = 51.509364;
  var _longitude = -0.128928;

  var MainPoint = LatLng(51.509364, -0.128928);
  var iShowing = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: iShowing,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: CustomDrawer(),
        body: Container(
          color: CommonFunctions.hexStringToColor("#f0f0f0"),
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
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
            Container(
              margin: EdgeInsets.only(top: 5.w),
              color: Colors.white,
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 2.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add New Request",
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
                      "You can add new request to review and calculate for your result",
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
                    child: Form(
                      child: Column(
                        children: [
                          DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(20),
                              isExpanded: true,
                              hint: Text("Select Your Energy Type"),
                              decoration: InputDecoration(
                                  labelText: "Select Your Energy Type",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              elevation: 5,
                              value: (EnergyType == ""
                                  ? dropdownItemsEnergyType.first.value
                                  : EnergyType),
                              items: dropdownItemsEnergyType,
                              onChanged: (String? newValue) {
                                setState(() {
                                  EnergyType = newValue!;
                                });
                              }),
                          formDivider,
                          DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(20),
                              isExpanded: true,
                              decoration: InputDecoration(
                                  labelText: "Select Your Customer Type",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              elevation: 5,
                              value: (CustomerType == ""
                                  ? dropdownItemsCustomerType.first.value
                                  : CustomerType),
                              items: dropdownItemsCustomerType,
                              onChanged: (String? newValue) {
                                setState(() {
                                  CustomerType = newValue!;
                                });
                              }),
                          formDivider,
                          DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(20),
                              isExpanded: true,
                              decoration: InputDecoration(
                                  labelText:
                                      "Select Your Generated Electricity Type",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              elevation: 5,
                              value: (GeneratedElectricityType == ""
                                  ? dropdownItemsGeneratedElectricityType
                                      .first.value
                                  : GeneratedElectricityType),
                              items: dropdownItemsGeneratedElectricityType,
                              onChanged: (String? newValue) {
                                setState(() {
                                  GeneratedElectricityType = newValue!;
                                });
                              }),
                          formDivider,
                          DropdownButtonFormField(
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(20),
                              decoration: InputDecoration(
                                  labelText: "Select Your Budget Type",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              elevation: 5,
                              value: (BudgetType == ""
                                  ? dropdownItemsBudgetType.first.value
                                  : BudgetType),
                              items: dropdownItemsBudgetType,
                              onChanged: (String? newValue) {
                                setState(() {
                                  BudgetType = newValue!;
                                  if (BudgetType ==
                                      dropdownItemsBudgetType.first.value) {
                                    DistinguishType = true;
                                  } else {
                                    DistinguishType = false;
                                  }
                                });
                              }),
                          formDivider,
                          Visibility(
                            visible: DistinguishType,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: KwController,
                              decoration: InputDecoration(
                                constraints:
                                    const BoxConstraints(maxHeight: 50),
                                hintStyle: TextStyle(fontSize: 12.sp),
                                hintText: "Enter Required Capacity(KW)",
                                contentPadding: const EdgeInsets.all(10),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !DistinguishType,
                            child: TextFormField(
                              controller: budgetController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 12.sp),
                                constraints:
                                    const BoxConstraints(maxHeight: 50),
                                hintText: "Enter your budget",
                                contentPadding: const EdgeInsets.all(10),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                          formDivider,
                          TextFormField(
                            controller: ConsumptionController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxHeight: 50),
                              hintText:
                                  "Enter Your Distance From Production to Consumption",
                              hintStyle: TextStyle(fontSize: 12.sp),
                              contentPadding: const EdgeInsets.all(10),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          formDivider,
                          TextFormField(
                            controller: NElecToolsController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              constraints: BoxConstraints(maxHeight: 50),
                              hintText: "Number of Electrical Tools You Use",
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          formDivider,
                          DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(20),
                              isExpanded: true,
                              decoration: InputDecoration(
                                  labelText: "Do you Need Energy Storage?",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonFunctions.hexStringToColor(
                                            "#c0c0c0"),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              elevation: 5,
                              value: (EnergyStorage == ""
                                  ? dropdownItemsEnergyStorage.first.value
                                  : EnergyStorage),
                              items: dropdownItemsEnergyStorage,
                              onChanged: (String? newValue) {
                                setState(() {
                                  EnergyStorage = newValue!;
                                });
                              }),
                          formDivider,
                          TextFormField(
                            controller: KWController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              constraints: BoxConstraints(maxHeight: 50),
                              hintText: "Your Energy Consumption(KW)",
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          formDivider,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RadioListTile(
                                title: Text("This is my exact location",
                                    style: TextStyle(fontSize: 14.sp)),
                                dense: true,
                                value: true,
                                groupValue: MapType,
                                contentPadding: EdgeInsets.zero,
                                onChanged: (value) {
                                  setState(() {
                                    MapType = true;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text("this is my estimated location",
                                    style: TextStyle(fontSize: 14.sp)),
                                dense: true,
                                value: false,
                                groupValue: MapType,
                                contentPadding: EdgeInsets.zero,
                                onChanged: (value) {
                                  setState(() {
                                    MapType = false;
                                  });
                                },
                              )
                            ],
                          ),
                          formDivider,
                          Visibility(
                              visible: MapType,
                              child: SizedBox(
                                height: 30.h,
                                width: 85.w,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle),
                                  child: FlutterMap(
                                    mapController: mapController,
                                    options: MapOptions(
                                      center: MainPoint,
                                      zoom: 9.2,
                                      onMapReady: () => () {
                                        mapController.center.latitude =
                                            _latitude;
                                        mapController.center.longitude =
                                            _longitude;
                                      },
                                      onPositionChanged:
                                          (position, hasGesture) => () {
                                        setState(() {
                                          _latitude = position.center!.latitude;
                                          _latitude =
                                              position.center!.longitude;
                                        });
                                      },
                                      onMapEvent: (position) => {
                                        setState(
                                            () => MainPoint = position.center)
                                      },
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName: 'com.example.app',
                                      ),
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                            point: MainPoint, //,
                                            width: 80,
                                            height: 80,
                                            builder: (context) => Image.asset(
                                                "assets/images/markerIcon.png"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Visibility(
                              visible: !MapType,
                              child: SizedBox(
                                height: 30.h,
                                width: 85.w,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle),
                                  child: FlutterMap(
                                    mapController: mapController,
                                    options: MapOptions(
                                      center: MainPoint,
                                      zoom: 9.2,
                                      maxZoom: 10,
                                      onMapReady: () => () {
                                        mapController.center.latitude =
                                            _latitude;
                                        mapController.center.longitude =
                                            _longitude;
                                      },
                                      onPositionChanged:
                                          (position, hasGesture) => () {
                                        setState(() {
                                          _latitude = position.center!.latitude;
                                          _latitude =
                                              position.center!.longitude;
                                        });
                                      },
                                      onMapEvent: (position) => {
                                        setState(
                                            () => MainPoint = position.center)
                                      },
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName: 'com.example.app',
                                      ),
                                      PolygonLayer(
                                        polygonCulling: true,
                                        polygons: [
                                          Polygon(
                                              points: [
                                                LatLng(
                                                    MainPoint.latitude + 0.06,
                                                    MainPoint.longitude + 0.08),
                                                LatLng(
                                                    MainPoint.latitude + 0.06,
                                                    MainPoint.longitude - 0.09),
                                                LatLng(
                                                    MainPoint.latitude - 0.03,
                                                    MainPoint.longitude - 0.09),
                                                LatLng(
                                                    MainPoint.latitude - 0.03,
                                                    MainPoint.longitude + 0.08),
                                              ],
                                              color: Colors.white60,
                                              isFilled: true,
                                              borderColor: Colors.black,
                                              isDotted: true,
                                              borderStrokeWidth: 1),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          formDivider,
                          TextFormField(
                            controller: DescriptionController,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              hintText: "Description",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          formDivider,
                          SizedBox(
                            width: min(41.w, 200),
                            height: min(12.w, 60),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    iShowing = true;
                                  });
                                  OrderService(context)
                                      .SetOrder(
                                          EnergyType,
                                          CustomerType,
                                          BudgetType,
                                          GeneratedElectricityType,
                                          ConsumptionController.text,
                                          budgetController.text,
                                          KwController.text,
                                          Distance,
                                          NElecToolsController.text,
                                          EnergyStorage,
                                          mapController.center.latitude,
                                          mapController.center.longitude,
                                          MapType,
                                          DescriptionController.text,
                                          MapType
                                              ? 0
                                              : MainPoint.latitude + 0.06,
                                          MapType
                                              ? 0
                                              : MainPoint.longitude + 0.08,
                                          MapType
                                              ? 0
                                              : MainPoint.latitude + 0.06,
                                          MapType
                                              ? 0
                                              : MainPoint.longitude - 0.09,
                                          MapType
                                              ? 0
                                              : MainPoint.latitude - 0.03,
                                          MapType
                                              ? 0
                                              : MainPoint.longitude - 0.09,
                                          MapType
                                              ? 0
                                              : MainPoint.latitude - 0.03,
                                          MapType
                                              ? 0
                                              : MainPoint.longitude + 0.08)
                                      .then((value) {
                                    setState(() {
                                      iShowing = false;
                                    });
                                  });
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
                          formDivider,
                        ],
                      ),
                    )),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
