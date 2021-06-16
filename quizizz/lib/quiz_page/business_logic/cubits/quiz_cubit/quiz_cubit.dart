import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizizz/quiz_page/data/model/quiz_model_data.dart';
import 'package:quizizz/quiz_page/data/repository/quiz_repository.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizLoading());

  readQuiz(int index) {
    emit(QuizLoading());
    QuizRepository().getQuizes().then(
          (value) => emit(
            QuizLoaded(value,value[index]),
          ),
        );
  }
}
