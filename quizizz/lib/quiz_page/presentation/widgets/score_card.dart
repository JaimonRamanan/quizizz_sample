import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final double height, width;
  final String score;
  final double fontSize;
  final Color fontColor;
  const ScoreCard({
    Key key,
    @required this.height,
    @required this.width,
    @required this.score,
   @required this.fontSize,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Center(
          child: Text(
            score,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                color: fontColor),
          ),
        ),
      ),
    );
  }
}