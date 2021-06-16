import 'package:flutter/material.dart';
import 'package:quizizz/quiz_page/presentation/widgets/content_text.dart';
import 'package:quizizz/quiz_page/presentation/widgets/option_number.dart';

class AnswerCard extends StatelessWidget {
  final MaterialColor color;
  final String option;
  final Function() onTap;
  final int number;
  const AnswerCard({
    Key key,
    @required this.color,
    @required this.number,
    @required this.option,@required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.40,
          padding: EdgeInsets.all(
            5.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            color: color,
          ),
          child: Stack(
            children: [
              Center(
                child: ContentText(text:
                  option,
                ),
              ),
              Positioned.fill(
                child: OptionNumber(
                  color: color,
                  number: number,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
