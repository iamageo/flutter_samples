import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizz/screens/quiz/quiz_screen.dart';

import '../../constants.dart';
import '../../controller/question_controller.dart';

class Welcome extends StatelessWidget {

  QuestionController _qnController = Get.put(QuestionController());
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Quiz App",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'name',
                  ),
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              )
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;

                    _qnController.changeName(name);

                    Get.to(() => const QuizScreen());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text("Start quizz"))),
            ),
          ),
        ],
      ),
    ));
  }
}
