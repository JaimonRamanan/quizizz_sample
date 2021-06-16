import 'package:flutter/material.dart';
import 'package:quizizz/quiz_page/presentation/widgets/score_section.dart';

class QuizResultPage extends StatefulWidget {
  final int totalScore;
  final int userScore;

  const QuizResultPage(
      {Key key, @required this.totalScore, @required this.userScore})
      : super(key: key);
  @override
  _QuizResultPageState createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A1B9A),
      body: Center(
        child: Column(
          children: [
            Text(
              'You Get',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ScoreSection(
              totalScore: widget.totalScore,
              userScore: widget.userScore,
            ),
          ],
        ),
      ),
    );
  }
}
