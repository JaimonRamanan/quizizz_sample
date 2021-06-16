import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizizz/quiz_page/business_logic/cubits/quiz_cubit/quiz_cubit.dart';
import 'package:quizizz/quiz_page/presentation/pages/quiz_result_page.dart';
import 'package:quizizz/quiz_page/presentation/widgets/answer_card.dart';
import 'package:quizizz/quiz_page/presentation/widgets/content_text.dart';
import 'package:quizizz/quiz_page/presentation/widgets/play_button.dart';
import 'package:quizizz/quiz_page/presentation/widgets/points_card.dart';
import 'package:quizizz/quiz_page/presentation/widgets/progress_bar.dart';
import 'package:quizizz/quiz_page/presentation/widgets/qn_progress_bar.dart';
import 'package:quizizz/quiz_page/presentation/widgets/question_number_card.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  int sec = 15;
  var index = 0;
  int correctAns = 0;
  bool isSelected = false;
  int score = 0;

  var color = [
    MaterialColor(0xFF1976D2, const {900: const Color(0xFFEF5350)}),
    MaterialColor(0xFF26A69A, const {900: const Color(0xFFEF5350)}),
    MaterialColor(0xFFF9A825, const {200: const Color(0xFFEF5350)}),
    MaterialColor(0xFFFF8A65, const {900: const Color(0xFFEF5350)}),
  ];

  @override
  void initState() {
    super.initState();
    context.read<QuizCubit>().readQuiz(index);
    countDownTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A1B9A),
      body: BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
        if (state is QuizLoading) {
          return Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
        if (state is QuizLoaded) {
          var quizOptions = [
            state.quizes[index].option1,
            state.quizes[index].option2,
            state.quizes[index].option3,
            state.quizes[index].option4,
          ];
          var noOfQuizes = state.quizes.length;
          return ListView(
            children: [
              ProgressBar(sec: sec),
              Container(
                height: 50.0,
                width: double.infinity,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayButton(
                      onTap: () {},
                    ),
                    QuestionNumberCard(
                      index: index,
                      totalQuestions: noOfQuizes,
                    ),
                    QnProgreesBar(index: index, noOfQuizes: noOfQuizes),
                    PointsCard(score: score)
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.90,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        8.0,
                      ),
                      child: ContentText(
                        text: state.quizes[index].question,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                    SizedBox(
                      height: 400,
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                          4,
                          (position) {
                            return Center(
                              child: AnswerCard(
                                onTap: isSelected
                                    ? () {}
                                    : () {
                                        if (quizOptions[position] ==
                                            state.quizes[index].answerKey) {
                                          setState(() {
                                            color[position] = Colors.green;
                                            correctAns += 1;
                                            isSelected = true;
                                            score += 280;
                                          });
                                          showSnackBar("CORRECT", Colors.green);
                                        }
                                        if (quizOptions[position] !=
                                            state.quizes[index].answerKey) {
                                          quizOptions.forEach((option) {
                                            if (option ==
                                                state.quizes[index].answerKey) {
                                              var pos =
                                                  quizOptions.indexOf(option);
                                              color[pos] = Colors.green;
                                            }
                                          });
                                          setState(() {
                                            isSelected = true;
                                            color[position] = Colors.red;
                                          });
                                          showSnackBar("INCORRECT", Colors.red);
                                        }
                                        Future.delayed(Duration(seconds: 4),
                                            () {
                                          if (state.quizes.length - 1 !=
                                              index) {
                                            setState(
                                              () {
                                                index++;
                                                isSelected = false;
                                                color = [
                                                  MaterialColor(
                                                      0xFF1976D2, const {
                                                    900: const Color(0xFFEF5350)
                                                  }),
                                                  MaterialColor(
                                                      0xFF26A69A, const {
                                                    900: const Color(0xFFEF5350)
                                                  }),
                                                  MaterialColor(
                                                      0xFFF9A825, const {
                                                    200: const Color(0xFFEF5350)
                                                  }),
                                                  MaterialColor(
                                                      0xFFFF8A65, const {
                                                    900: const Color(0xFFEF5350)
                                                  }),
                                                ];

                                                sec = 15;
                                              },
                                            );
                                            countDownTimer();
                                            Future.delayed(
                                              Duration(seconds: 1),
                                            );
                                            context
                                                .read<QuizCubit>()
                                                .readQuiz(index);
                                          } else {
                                            Future.delayed(
                                              Duration(seconds: 1),
                                            );
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    QuizResultPage(
                                                  totalScore: noOfQuizes,
                                                  userScore: correctAns,
                                                ),
                                              ),
                                            );
                                          }
                                        });
                                      },
                                color: color[position],
                                option: quizOptions[position],
                                number: position + 1,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }
        return Container();
      }),
    );
  }

  void countDownTimer() {
    Timer.periodic(
      Duration(
        seconds: 1,
      ),
      (Timer timer) {
        if (sec == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(
            () {
              sec--;
            },
          );
        }
      },
    );
  }

  void showSnackBar(text, color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: color,
      ),
    );
  }
}
