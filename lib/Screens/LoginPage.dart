import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reiscanada/Common/Common.dart';
import 'package:reiscanada/Enum/enums.dart';
import 'package:reiscanada/Screens/HomePage.dart';
import 'package:reiscanada/Screens/SignUp.dart';
import 'package:reiscanada/Services/LoginService.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  var borderStyleButtons = const BorderSide(color: Colors.lightBlue, width: 1);
  var borderRadiosButtons = BorderRadius.circular(10);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: const TextStyle(decoration: TextDecoration.none),
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
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
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Login",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30.0.sp))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 16),
                      child: Text(
                          "Welcome! Login to get our service for you and submit your request",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0.sp)),
                    ),
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
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      constraints:
                                          BoxConstraints(maxHeight: 50),
                                      hintText: "Email",
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                    controller: emailController,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        constraints:
                                            BoxConstraints(maxHeight: 50),
                                        hintText: "Password",
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                      ),
                                      controller: passwordController,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Row(
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
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SignUpPage()))
                                            },
                                            child: Text("Create account",
                                                style:
                                                    TextStyle(fontSize: 13.sp)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: min(41.w, 200),
                                          child: ElevatedButton(
                                              onPressed: () => {
                                                    LoginService(context)
                                                        .SignIn(
                                                            emailController
                                                                .text,
                                                            passwordController
                                                                .text)
                                                        .then((value) => () {
                                                              print(value);
                                                              if (value ==
                                                                  true) {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const HomePage()));
                                                              } else {
                                                                CommonFunctions.ShowMessage(
                                                                    "There is an unexpected error , Please try again",
                                                                    context,
                                                                    MessageType
                                                                        .Error);
                                                              }
                                                            })
                                                  },
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          borderRadiosButtons),
                                                  side: borderStyleButtons),
                                              child: Text("Login",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: Colors.white))),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Center(
                                        child: Text("Forget your password?",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.underline))),
                                  )
                                ],
                              ))
                            ],
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
