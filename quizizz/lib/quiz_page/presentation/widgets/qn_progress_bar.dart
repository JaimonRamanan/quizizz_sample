import 'package:flutter/material.dart';

class QnProgreesBar extends StatelessWidget {
  const QnProgreesBar({
    Key key,
    @required this.index,
    @required this.noOfQuizes,
  }) : super(key: key);

  final int index;
  final int noOfQuizes;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.30,
          height: 25,
          child: LinearProgressIndicator(
            value: index / noOfQuizes,
            color: Colors.yellow[700],
            backgroundColor: Colors.black,
          ),
        ),
        Positioned(
          left: 5.0,
          top: 5.0,
          child: Text(
            "Streak",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
