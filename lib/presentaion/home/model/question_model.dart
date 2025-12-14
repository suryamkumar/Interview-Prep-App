class QuestionModel {
  final String id;
  final String question;
  final String role;
  final String difficulty;
  final List<String> keywords;

  QuestionModel({
    required this.id,
    required this.question,
    required this.role,
    required this.difficulty,
    required this.keywords,
  });
}

