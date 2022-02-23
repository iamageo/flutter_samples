import 'package:flutter/material.dart';
import 'package:quizz/screens/quiz/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: Body(),
    );
  }
}
