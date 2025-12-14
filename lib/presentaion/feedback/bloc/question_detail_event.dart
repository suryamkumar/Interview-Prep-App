part of 'question_detail_bloc.dart';

@immutable
sealed class QuestionDetailEvent {}

final class SubmitAnswerEvent extends QuestionDetailEvent {
  final String questionId;
  final String questionText;
  final String answer;


  SubmitAnswerEvent({
    required this.questionId,
    required this.questionText,
    required this.answer,
  });
}
