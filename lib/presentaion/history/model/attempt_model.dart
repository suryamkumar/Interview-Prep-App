import 'package:hive/hive.dart';
part 'attempt_model.g.dart';

@HiveType(typeId: 1)
class AttemptModel extends HiveObject {
  @HiveField(0)
  final String questionId;

  @HiveField(1)
  final String questionText;

  @HiveField(2)
  final String answer;

  @HiveField(3)
  final int score;

  @HiveField(4)
  final DateTime dateTime;

  AttemptModel({
    required this.questionId,
    required this.questionText,
    required this.answer,
    required this.score,
    required this.dateTime,
  });
}

