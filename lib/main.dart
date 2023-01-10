import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Reis Canada',
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData(primarySwatch: Colors.lightBlue, fontFamily: 'Pashtu'),
          home: const SplashScreen());
    });
  }
}
