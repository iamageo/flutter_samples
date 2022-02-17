import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizz/screens/quiz/quiz_screen.dart';

import '../../constants.dart';
import '../../controller/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    QuestionController _qnController = Get.put(QuestionController());

    return Scaffold(
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Score",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: kSecondaryColor),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "${_qnController.numOfCorrectAns}/${_qnController.questions.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kSecondaryColor),
                    ),
                  ),
                ),

                Expanded(
                  child: Center(
                    child: ElevatedButton(onPressed: () {
                      Get.to(() => const QuizScreen());
                      Get.deleteAll();
                    },
                        child: Container(
                            padding: const EdgeInsets.all(16),
                            child: const Text("Back to home"))),
                  ),
                ),

              ],
            ),
          )
    );
  }
}