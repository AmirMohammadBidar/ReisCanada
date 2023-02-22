import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:reiscanada/Common/SharedPreferenceHelper.dart';
import 'package:reiscanada/Enum/enums.dart';
import 'package:reiscanada/Screens/HomePage.dart';
import 'package:reiscanada/Services/LoginService.dart';
import 'package:sizer/sizer.dart';

import '../Common/Common.dart';
import '../Widgets/CustomDrawer.dart';
import '../Widgets/TopProfileBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var borderStyleButtons = BorderSide(
      color: CommonFunctions.hexStringToColor("#43b79c"),
      width: 1,
      style: BorderStyle.none);
  var borderRadiosButtons = BorderRadius.circular(10);
  var formDivider = const Divider(color: Colors.transparent, height: 15);
  var EmailController =
      TextEditingController(text: HomePage.profileModel?.email);
  var FirstNameController =
      TextEditingController(text: HomePage.profileModel?.firstName);
  var LastNameController =
      TextEditingController(text: HomePage.profileModel?.lastName);
  var CompanyNameController =
      TextEditingController(text: HomePage.profileModel?.companyName);
  var UserType = HomePage.profileModel?.userType.toString();
  List<DropdownMenuItem<String>> get dropdownItemsUserType {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "2", child: Text("Individual")),
      const DropdownMenuItem(value: "3", child: Text("Organization/Company")),
      const DropdownMenuItem(value: "4", child: Text("Government")),
    ];
    print(ModalRoute.of(context)!.settings.name);
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: CommonFunctions.isShowing,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: const CustomDrawer(),
        body: Container(
          color: CommonFunctions.hexStringToColor("#f0f0f0"),
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            TopProfilebar(isProfilePage: true),
            Container(
              margin: EdgeInsets.only(top: 5.w),
              color: Colors.white,
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 2.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your profile",
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
                      "You Can Edit Your Profile Here",
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
                          TextFormField(
                            controller: EmailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxHeight: 50),
                              hintText: "Your User Name",
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
                            controller: FirstNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxHeight: 50),
                              hintText: "Your First Name",
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
                            controller: LastNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxHeight: 50),
                              hintText: "Your Last Name",
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
                            controller: CompanyNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              constraints: const BoxConstraints(maxHeight: 50),
                              hintText: "Your Company Name",
                              hintStyle: TextStyle(fontSize: 12.sp),
                              contentPadding: const EdgeInsets.all(10),
                              border: const OutlineInputBorder(
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
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
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
                              value: UserType,
                              items: dropdownItemsUserType,
                              onChanged: (String? newValue) {
                                setState(() {
                                  UserType = newValue!;
                                });
                              }),
                          formDivider,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: min(41.w, 200),
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (EmailController.text == "") {
                                        CommonFunctions.ShowMessage(
                                            "Please enter your Email",
                                            context,
                                            MessageType.Error);
                                        return;
                                      }
                                      if (FirstNameController.text == "") {
                                        CommonFunctions.ShowMessage(
                                            "Please enter your first name",
                                            context,
                                            MessageType.Error);
                                        return;
                                      }
                                      if (LastNameController.text == "") {
                                        CommonFunctions.ShowMessage(
                                            "Please enter your last name",
                                            context,
                                            MessageType.Error);
                                        return;
                                      }
                                      setState(() {
                                        CommonFunctions.isShowing = true;
                                      });
                                      LoginService(context)
                                          .ChangeProfile(
                                              EmailController.text,
                                              FirstNameController.text,
                                              LastNameController.text,
                                              CompanyNameController.text,
                                              int.parse(UserType!))
                                          .then((value) {
                                        CommonFunctions.ShowMessage(
                                            "Profile successfully changed",
                                            context,
                                            MessageType.Success);

                                        Future.delayed(
                                            const Duration(seconds: 3), () {
                                          setState(() {
                                            CommonFunctions.isShowing = false;
                                          });
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()));
                                        });
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: borderRadiosButtons),
                                        side: borderStyleButtons),
                                    child: Text("Submit",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.white))),
                              ),
                              SizedBox(
                                width: min(41.w, 200),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      CommonFunctions.showAlertDialog(
                                          context,
                                          "Warning",
                                          "Are you sure you want to log out?",
                                          () async {
                                        await SharedPreferencesHelper.Clear();
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/LoginPage',
                                                (Route<dynamic> route) =>
                                                    false);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: borderRadiosButtons),
                                        side: borderStyleButtons),
                                    child: Text("Log out",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.white))),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              CommonFunctions.LaunchEmailSubmission(
                                  context, "info@reiscanada.com", "", "");
                            },
                            child: Expanded(
                                child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.black, width: 0.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    shadowColor: Colors.black,
                                    child: SizedBox(
                                        width: 80.w,
                                        height: 5.h,
                                        child: Center(
                                            child:
                                                Text("info@reiscanada.com"))))),
                          )
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
