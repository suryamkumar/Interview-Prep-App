import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../model/question_model.dart';
import '../repository/question_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final QuestionRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadQuestionsEvent>(_loadQuestions);
  }

  Future<void> _loadQuestions(
      LoadQuestionsEvent event,
      Emitter<HomeState> emit,
      ) async {
    emit(HomeLoading());

    try {
      final questions = await repository.getQuestions();
      emit(HomeLoaded(questions: questions));
    } catch (_) {
      emit(HomeError(message: "Failed to load questions"));
    }
  }
}
