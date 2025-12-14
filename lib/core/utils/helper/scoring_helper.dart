int calculateScore(String answer) {
  final length = answer.trim().length;

  if (length < 30) return 1;
  if (length < 60) return 2;
  if (length < 100) return 3;
  if (length < 150) return 4;
  return 5;
}
