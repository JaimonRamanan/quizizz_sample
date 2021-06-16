part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizLoading extends QuizState {}

class QuizError extends QuizState {}

class QuizLoaded extends QuizState {
  final QuizModelData quiz;
  final List<QuizModelData> quizes;
  QuizLoaded(this.quizes, this.quiz);
}
