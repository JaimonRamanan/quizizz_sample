import 'package:flutter/material.dart';
import 'package:quizizz/quiz_page/presentation/widgets/score_card.dart';

class ScoreSection extends StatelessWidget {
  const ScoreSection({
    Key key,
    @required this.totalScore,
    @required this.userScore,
  }) : super(key: key);

  final int totalScore;
  final int userScore;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Positioned(
        top: MediaQuery.of(context).size.height * 0.38,
        right: 70.0,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.height * 0.23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 5.0),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 90.0, left: 110.0),
                  child: ScoreCard(
                    score: '$totalScore',
                    height: 70.0,
                    width: 70.0,
                    fontSize: 40.0,
                  ),
                ),
                Positioned(
                  top: 20.0,
                  left: 40.0,
                  child: ScoreCard(
                    score: '$userScore',
                    height: 90.0,
                    width: 90.0,
                    fontSize: 60,
                    fontColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
