import 'package:flutter/material.dart';

class QuestionNumberCard extends StatelessWidget {
  const QuestionNumberCard({
    Key key,
    @required this.index,
    this.totalQuestions,
  }) : super(key: key);

  final int index;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.0,
      height: 25.0,
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.grey[800],
      ),
      child: Text(
        '${index + 1}/$totalQuestions',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
