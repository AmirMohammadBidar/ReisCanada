import 'package:flutter/material.dart';
import 'package:reiscanada/Screens/SplashScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  //final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        //key: _scaffoldKey,
        title: 'Reis Canada',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.lightBlue, fontFamily: 'Pashtu'),
        home: const Scaffold(
          body: SplashScreen(),
        ),
      );
    });
  }
}
