import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
    @required this.sec,
  }) : super(key: key);

  final int sec;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: MediaQuery.of(context).size.width,
      lineHeight: 5.0,
      percent: sec / 15,
      backgroundColor:Color(0xFF6A1B9A),
      progressColor: sec > 7
          ? Colors.grey
          : sec > 3
              ? Colors.orange
              : Colors.red,
    );
  }
}
