part of 'question_detail_bloc.dart';

@immutable
sealed class QuestionDetailState {}

final class QuestionDetailInitial extends QuestionDetailState {}

final class QuestionDetailLoading extends QuestionDetailState {}

final class QuestionSubmitted extends QuestionDetailState {
  final int score;
  final String feedback;

  QuestionSubmitted({
    required this.score,
    required this.feedback,
  });
}
