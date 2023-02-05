import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../Common/Common.dart';
import '../Services/OrderService.dart';
import '../Widgets/CustomDrawer.dart';
import '../Widgets/TopProfileBar.dart';

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

  List<DropdownMenuItem<int>> get dropdownItemsEnergyType {
    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(value: 27, child: Text("Photovoltaic Energy")),
      const DropdownMenuItem(value: 28, child: Text("CSP")),
      const DropdownMenuItem(value: 29, child: Text("Wind Energy Onshore")),
      const DropdownMenuItem(value: 30, child: Text("Wind Energy Offshore")),
      const DropdownMenuItem(value: 31, child: Text("Hydroelectric Energy")),
      const DropdownMenuItem(value: 32, child: Text("Geothermal Energy")),
      const DropdownMenuItem(
          value: 33, child: Text("Biomass and Biogas Energy")),
      const DropdownMenuItem(value: 34, child: Text("Ocean Energy Wave Power")),
      const DropdownMenuItem(value: 35, child: Text("Ocean Energy Water Flow")),
      const DropdownMenuItem(value: 36, child: Text("Water Flow Tide")),
    ];
    return menuItems;
  }

  var EnergyType = 27;

  List<DropdownMenuItem<int>> get dropdownItemsCustomerType {
    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(value: 38, child: Text("Residential")),
      const DropdownMenuItem(value: 39, child: Text("Corporate")),
      const DropdownMenuItem(value: 40, child: Text("Schools and Colleges")),
      const DropdownMenuItem(value: 41, child: Text("Estate / Farm House")),
      const DropdownMenuItem(value: 42, child: Text("Government")),
      const DropdownMenuItem(value: 43, child: Text("SMEs"))
    ];
    return menuItems;
  }

  var CustomerType = 38;

  List<DropdownMenuItem<int>> get dropdownItemsGeneratedElectricityType {
    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(
          value: -1,
          child: Text(
              overflow: TextOverflow.ellipsis,
              "Select Your Generated Electricity Type")),
      const DropdownMenuItem(value: 45, child: Text("Sell")),
      const DropdownMenuItem(value: 46, child: Text("Save")),
      const DropdownMenuItem(value: 47, child: Text("Consumption")),
      const DropdownMenuItem(value: 48, child: Text("Sell And Save")),
      const DropdownMenuItem(value: 49, child: Text("Cryptocurrency"))
    ];
    return menuItems;
  }

  var GeneratedElectricityType = 45;

  List<DropdownMenuItem<int>> get dropdownItemsBudgetType {
    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(value: 54, child: Text("Distinguish")),
      const DropdownMenuItem(value: 55, child: Text("NotDistinguish"))
    ];
    return menuItems;
  }

  var BudgetType = 54;

  List<DropdownMenuItem<int>> get dropdownItemsEnergyStorage {
    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(value: 1, child: Text("Yes")),
      const DropdownMenuItem(value: 0, child: Text("No"))
    ];
    return menuItems;
  }

  var EnergyStorage = 1;

  final TextEditingController MegawatController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: CommonFunctions.isShowing,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: CustomDrawer(),
        body: Container(
          color: CommonFunctions.hexStringToColor("#f0f0f0"),
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            TopProfilebar(),
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
                              onChanged: (int? newValue) {
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
                              onChanged: (int? newValue) {
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
                              value: GeneratedElectricityType,
                              items: dropdownItemsGeneratedElectricityType,
                              onChanged: (int? newValue) {
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
                              onChanged: (int? newValue) {
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
                            visible: !DistinguishType,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: MegawatController,
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
                            visible: DistinguishType,
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
                              onChanged: (int? newValue) {
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
                                onPressed: () async {
                                  setState(() {
                                    CommonFunctions.isShowing = true;
                                  });

                                  var value = await OrderService(context)
                                      .SetOrder(
                                          EnergyType,
                                          CustomerType,
                                          BudgetType,
                                          GeneratedElectricityType,
                                          KWController.text == ""
                                              ? 0
                                              : int.parse(
                                                  KWController.text.toString()),
                                          budgetController.text == ""
                                              ? null
                                              : int.parse(
                                                  budgetController.text),
                                          MegawatController.text == ""
                                              ? -1
                                              : int.parse(
                                                  MegawatController.text),
                                          ConsumptionController.text == ""
                                              ? 0
                                              : int.parse(
                                                  ConsumptionController.text),
                                          NElecToolsController.text == ""
                                              ? 0
                                              : int.parse(
                                                  NElecToolsController.text),
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
                                              : MainPoint.longitude + 0.08);
                                  setState(() {
                                    CommonFunctions.isShowing = false;
                                  });
                                  print(value);
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
