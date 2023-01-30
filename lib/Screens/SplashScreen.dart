import 'package:flutter/material.dart';
import 'package:reiscanada/Services/LoginService.dart';
import 'package:sizer/sizer.dart';

import '../Common/SharedPreferenceHelper.dart';
import 'HomePage.dart';
import 'LoginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double opacityLoading = 0;

  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
      animationBehavior: AnimationBehavior.normal)
    ..forward()
    ..addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        this.setState(() {
          opacityLoading = 1;
        });
        var hasCred = await SharedPreferencesHelper.hasUserIdPassword();
        if (!hasCred) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        } else {
          LoginService(context).GetProfile().then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          });
        }
      }
    });
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linearToEaseOut,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 70.w,
              height: 70.w,
              child: ScaleTransition(
                  scale: _animation,
                  child: Image.asset('assets/images/reislogo.png',
                      width: 100.w,
                      height: 100.w,
                      fit: BoxFit.contain,
                      opacity: _animation)),
            ),
            AnimatedOpacity(
                opacity: opacityLoading,
                duration: const Duration(seconds: 1),
                child: const CircularProgressIndicator())
          ],
        ));
  }
}
