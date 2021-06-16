import 'package:flutter/material.dart';
import 'package:quizizz/global/data/route_names.dart';
import 'package:quizizz/onboarding/widgets/heading_text.dart';
import 'package:quizizz/onboarding/widgets/nested_animated_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    );
    _controller.forward();
    animation = Tween(begin: 5.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn,
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RouteNames.HOME_PAGE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadingText(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              height: 130.0,
              width: 130.0,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(125.0),
              ),
              child: NestedAnimatedWidget(
                controller: _controller,
                height1: 90.0,
                width1: 90.0,
                color1: Color(0xFFAD1457),
                height2: 60.0,
                width2: 60.0,
                color2: Colors.red,
                child: NestedAnimatedWidget(
                  controller: _controller,
                  height1: 40.0,
                  width1: 40.0,
                  color1: Colors.yellow,
                  height2: 20.0,
                  width2: 20.0,
                  color2: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
