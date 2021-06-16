import 'package:flutter/material.dart';

class OptionNumber extends StatelessWidget {
  final int number;
  const OptionNumber({
    Key key,
    @required this.color,
    this.number,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
            color: color,
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
