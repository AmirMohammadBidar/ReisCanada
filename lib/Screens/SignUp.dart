import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reiscanada/Enum/enums.dart';
import 'package:reiscanada/Screens/LoginPage.dart';
import 'package:reiscanada/Services/LoginService.dart';
import 'package:sizer/sizer.dart';

import '../Common/Common.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var borderStyleButtons = const BorderSide(color: Colors.lightBlue, width: 1);
  var borderRadiosButtons = BorderRadius.circular(10);
  var formDivider = const Divider(color: Colors.transparent, height: 10);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final TextEditingController organizationNameController =
      TextEditingController();

  int clientType = Organizations.individual.value;
  bool needCompanyName = false;
  bool animationEnded = false;
  bool? newsFeed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: const TextStyle(decoration: TextDecoration.none),
        child: Container(
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/reislogo.png', width: 30.w)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w400,
                          fontSize: 30.0.sp),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Please register in order to checkout more quickly",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0.sp)),
              ),
              formDivider,
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Form(
                              child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: (50.w - 30),
                                    height: 50,
                                    child: TextFormField(
                                      controller: firstNameController,
                                      decoration: const InputDecoration(
                                        hintText: "First Name",
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: (50.w - 30),
                                    height: 50,
                                    child: TextFormField(
                                      controller: lastNameController,
                                      decoration: const InputDecoration(
                                        hintText: "Last Name",
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              formDivider,
                              TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  constraints: BoxConstraints(maxHeight: 50),
                                  hintText: "Email",
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                ),
                              ),
                              formDivider,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: (50.w - 30),
                                    height: 50,
                                    child: TextFormField(
                                      controller: passwordController,
                                      decoration: const InputDecoration(
                                        hintText: "Password",
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: (50.w - 30),
                                    height: 50,
                                    child: TextFormField(
                                      controller: repasswordController,
                                      decoration: const InputDecoration(
                                        hintText: "Re-enter Password",
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              formDivider,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RadioListTile(
                                    title: Text("Individual",
                                        style: TextStyle(fontSize: 14.sp)),
                                    dense: true,
                                    value: Organizations.individual.value,
                                    groupValue: clientType,
                                    contentPadding: EdgeInsets.zero,
                                    onChanged: (value) {
                                      setState(() {
                                        clientType =
                                            int.parse(value.toString());
                                        needCompanyName = false;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text("organization/Company",
                                        style: TextStyle(fontSize: 14.sp)),
                                    value: Organizations.company.value,
                                    groupValue: clientType,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    onChanged: (value) {
                                      setState(() {
                                        clientType =
                                            int.parse(value.toString());
                                        needCompanyName = true;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text("Government",
                                        style: TextStyle(fontSize: 14.sp)),
                                    value: Organizations.government.value,
                                    groupValue: clientType,
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    onChanged: (value) {
                                      setState(() {
                                        clientType =
                                            int.parse(value.toString());
                                        needCompanyName = false;
                                      });
                                    },
                                  )
                                ],
                              ),
                              AnimatedSize(
                                  curve: Curves.ease,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: Container(
                                    height: needCompanyName ? null : 0,
                                    child: Column(
                                      children: <Widget>[
                                        formDivider,
                                        TextFormField(
                                          controller:
                                              organizationNameController,
                                          decoration: const InputDecoration(
                                            constraints:
                                                BoxConstraints(maxHeight: 50),
                                            hintText: "Organization Name",
                                            contentPadding: EdgeInsets.all(10),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              formDivider,
                              CheckboxListTile(
                                title: Text(
                                    "Yes! Sign me up to receive email exclusive offers, the lastest news and more!"),
                                value: newsFeed,
                                onChanged: (newValue) {
                                  setState(() {
                                    newsFeed = newValue;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              formDivider,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: min(41.w, 200),
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  borderRadiosButtons),
                                          side: borderStyleButtons),
                                      onPressed: () => {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()))
                                      },
                                      child: Text("Sign in",
                                          style: TextStyle(fontSize: 13.sp)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: min(41.w, 200),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (passwordController.text !=
                                              repasswordController.text) {
                                            CommonFunctions.ShowMessage(
                                                "Your passwords don't match",
                                                context,
                                                MessageType.Error);
                                            return;
                                          }
                                          LoginService(context)
                                              .RegisterUser(
                                                  clientType,
                                                  firstNameController.text,
                                                  lastNameController.text,
                                                  organizationNameController
                                                      .text,
                                                  emailController.text,
                                                  passwordController.text,
                                                  newsFeed as bool)
                                              .then((value) {
                                            if (value == true) {
                                              CommonFunctions.ShowMessage(
                                                  "Your account successfully created",
                                                  context,
                                                  MessageType.Success);
                                              Timer(
                                                  Duration(seconds: 2),
                                                  () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const HomePage())));
                                            } else {
                                              CommonFunctions.ShowMessage(
                                                  "There is an unexpected error , Please try again",
                                                  context,
                                                  MessageType.Error);
                                            }
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    borderRadiosButtons),
                                            side: borderStyleButtons),
                                        child: Text("Register",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.white))),
                                  )
                                ],
                              ),
                              formDivider,
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
