import 'package:quizizz/quiz_page/data/model/quiz_model_data.dart';

class QuizRepository {
  final List<QuizModelData> quizes = [
    QuizModelData(
      question: 'Which planet in our solar system is known as the Red Planet?',
      option1: "Alexander Fleming",
      option2: "Alexander Graham Bell",
      option3: "Thomas Alva Edison",
      option4: "Mars",
      answerKey: "Mars",
    ),
    QuizModelData(
      question: 'Who invented the Light Bulb?',
      option1: "Mars",
      option2: "Thomas Alva Edison",
      option3: "Jupiter",
      option4: "Alexander Graham Bell",
      answerKey: "Thomas Alva Edison",
    ),
    QuizModelData(
      question: 'Who discovered Penicillin?',
      option1: "Alexander Graham Bell",
      option2: "Alexander Fleming",
      option3: "Thomas Alva Edison",
      option4: "Jupiter ",
      answerKey: "Alexander Fleming",
    ),
  ];

  Future<List<QuizModelData>> getQuizes() {
    return Future.delayed(Duration(seconds: 2), () => quizes);
  }
}
