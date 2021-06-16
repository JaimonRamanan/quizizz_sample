import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'QUIZIZZ',
      style: TextStyle(
        fontFamily: "QuickSand",
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
