import 'package:flutter/material.dart';

class IntroCard extends StatelessWidget {
  const IntroCard({
    Key key,
    @required this.sec,
  }) : super(key: key);

  final int sec;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black38,
      child: Center(
        child: Text(
          sec != 0 ? '$sec' : "GO!",
          style: TextStyle(
            fontSize: 50,
            fontFamily: "Montserrat",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
