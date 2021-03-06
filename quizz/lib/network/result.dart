class QuestionItem {
  String? category;
  String? type;
  String? difficulty;
  String? question;
  String? correctAnswer;
  late List<String> allAnswers;

  QuestionItem({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
     this.correctAnswer,
  });

  QuestionItem.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    allAnswers = json['incorrect_answers'].cast<String>();
    allAnswers.add(correctAnswer!);
    allAnswers.shuffle();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['type'] = type;
    data['difficulty'] = difficulty;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['incorrect_answers'] = allAnswers;
    return data;
  }
}
