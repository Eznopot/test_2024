class Question {
  final String text;
  final List<String> answers;
  final int correctIndex;

  Question(
      {required this.text, required this.answers, required this.correctIndex});
}
