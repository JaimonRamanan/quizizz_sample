import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:quizizz/global/data/route_names.dart';
import 'package:quizizz/home_page/presentation/widgets/intro_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  int sec = 3;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A148C),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
          child: FlipCard(
            key: cardKey,
            direction: FlipDirection.VERTICAL,
            flipOnTouch: false,
            front: IntroCard(sec: sec),
            back: IntroCard(sec: sec),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    Timer.periodic(
      Duration(seconds: 2),
      (Timer timer) {
        if (sec == 0) {
          setState(() {
            timer.cancel();
          });

          Future.delayed(
              Duration(
                seconds: 0.1.toInt(),
              ), () {
            Navigator.pushReplacementNamed(context, RouteNames.QUIZ_PAGE);
          });
          sec = 3;
        } else {
          setState(
            () {
              sec--;
            },
          );
          cardKey.currentState.toggleCard();
        }
      },
    );
  }
}
