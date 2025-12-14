import 'package:hive/hive.dart';

import '../model/attempt_model.dart';

abstract class AttemptRepository {
  Future<void> saveAttempt(AttemptModel attempt);
  List<AttemptModel> getAttempts();
}

class HiveAttemptRepository implements AttemptRepository {
  final Box<AttemptModel> box;

  HiveAttemptRepository(this.box);

  @override
  Future<void> saveAttempt(AttemptModel attempt) async {
    await box.add(attempt);
  }

  @override
  List<AttemptModel> getAttempts() {
    return box.values.toList().reversed.toList();
  }
}
