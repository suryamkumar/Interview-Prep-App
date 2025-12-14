import '../model/question_model.dart';

abstract class QuestionRepository {
  Future<List<QuestionModel>> getQuestions();
}

class DummyQuestionRepository implements QuestionRepository {
  @override
  Future<List<QuestionModel>> getQuestions() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      QuestionModel(
        id: "1",
        question: "What is Flutter?",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["widget", "dart", "ui"],
      ),
      QuestionModel(
        id: "2",
        question: "Explain BLoC architecture",
        role: "Mobile Developer",
        difficulty: "Medium",
        keywords: ["bloc", "state", "event"],
      ),
      QuestionModel(
        id: "3",
        question: "Difference between Stateful and Stateless widget",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["state", "rebuild"],
      ),
      QuestionModel(
        id: "4",
        question: "What is a Widget tree in Flutter?",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["widget", "tree", "build"],
      ),
      QuestionModel(
        id: "5",
        question: "What is setState() and when is it used?",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["setstate", "state", "rebuild"],
      ),
      QuestionModel(
        id: "6",
        question: "Explain MVVM architecture",
        role: "Mobile Developer",
        difficulty: "Medium",
        keywords: ["mvvm", "viewmodel", "model"],
      ),
      QuestionModel(
        id: "7",
        question: "What are Futures in Dart?",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["future", "async", "await"],
      ),
      QuestionModel(
        id: "8",
        question: "Difference between Future and Stream",
        role: "Flutter Developer",
        difficulty: "Medium",
        keywords: ["future", "stream", "async"],
      ),
      QuestionModel(
        id: "9",
        question: "What is dependency injection?",
        role: "Mobile Developer",
        difficulty: "Medium",
        keywords: ["di", "getit", "dependency"],
      ),
      QuestionModel(
        id: "10",
        question: "What is GetIt in Flutter?",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["getit", "di", "singleton"],
      ),
      QuestionModel(
        id: "11",
        question: "What is Hive and where is it used?",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["hive", "local", "database"],
      ),
      QuestionModel(
        id: "12",
        question: "Difference between Hive and SQLite",
        role: "Mobile Developer",
        difficulty: "Medium",
        keywords: ["hive", "sqlite", "storage"],
      ),
      QuestionModel(
        id: "13",
        question: "What is hot reload in Flutter?",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["hot", "reload", "state"],
      ),
      QuestionModel(
        id: "14",
        question: "Explain widget lifecycle",
        role: "Flutter Developer",
        difficulty: "Medium",
        keywords: ["lifecycle", "initstate", "dispose"],
      ),
      QuestionModel(
        id: "15",
        question: "What are Keys in Flutter?",
        role: "Flutter Developer",
        difficulty: "Medium",
        keywords: ["keys", "widget", "tree"],
      ),
      QuestionModel(
        id: "16",
        question: "What is BuildContext?",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["context", "widget", "tree"],
      ),
      QuestionModel(
        id: "17",
        question: "What is Cubit in BLoC?",
        role: "Flutter Developer",
        difficulty: "Medium",
        keywords: ["cubit", "bloc", "state"],
      ),
      QuestionModel(
        id: "18",
        question: "Difference between BLoC and Provider",
        role: "Mobile Developer",
        difficulty: "Medium",
        keywords: ["bloc", "provider", "state"],
      ),
      QuestionModel(
        id: "19",
        question: "What is Navigator and routes in Flutter?",
        role: "Flutter Developer",
        difficulty: "Easy",
        keywords: ["navigation", "routes", "navigator"],
      ),
      QuestionModel(
        id: "20",
        question: "How does Flutter render UI?",
        role: "Flutter Developer",
        difficulty: "Hard",
        keywords: ["rendering", "engine", "skia"],
      ),
    ];
  }
}
