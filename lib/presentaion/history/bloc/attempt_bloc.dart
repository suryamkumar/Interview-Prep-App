import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../model/attempt_model.dart';
import '../repository/attempt_repository.dart';

part 'attempt_event.dart';
part 'attempt_state.dart';

class AttemptBloc extends Bloc<AttemptEvent, AttemptState> {
  final AttemptRepository repository;

  AttemptBloc(this.repository) : super(AttemptInitial()) {
    on<LoadAttemptsEvent>(_loadAttempts);
  }

  void _loadAttempts(
      LoadAttemptsEvent event,
      Emitter<AttemptState> emit,
      ) {
    final attempts = repository.getAttempts();
    emit(AttemptsLoaded(attempts));
  }
}
