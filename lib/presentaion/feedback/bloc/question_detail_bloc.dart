import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/helper/scoring_helper.dart';
import '../../history/model/attempt_model.dart';
import '../../history/repository/attempt_repository.dart';

part 'question_detail_event.dart';
part 'question_detail_state.dart';

class QuestionDetailBloc
    extends Bloc<QuestionDetailEvent, QuestionDetailState> {
  final AttemptRepository repository;

  QuestionDetailBloc(this.repository)
      : super(QuestionDetailInitial()) {
    on<SubmitAnswerEvent>(_submitAnswer);
  }

  Future<void> _submitAnswer(
      SubmitAnswerEvent event,
      Emitter<QuestionDetailState> emit,
      ) async {
    emit(QuestionDetailLoading());

    final score = calculateScore(event.answer);

    final attempt = AttemptModel(
      questionId: event.questionId,
      answer: event.answer,
      score: score,
      dateTime: DateTime.now(),
      questionText: event.questionText,
    );

    await repository.saveAttempt(attempt);

    emit(
      QuestionSubmitted(
        score: score,
        feedback: _feedbackText(score),
      ),
    );
  }

  String _feedbackText(int score) {
    switch (score) {
      case 1:
        return "Answer too short. Add more details.";
      case 3:
        return "Good answer, can be improved.";
      case 5:
        return "Excellent answer!";
      default:
        return "Nice attempt.";
    }
  }
}
