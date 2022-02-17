import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizz/screens/quiz/quiz_screen.dart';

import '../../constants.dart';
import '../../controller/question_controller.dart';

class Welcome extends StatelessWidget {

  QuestionController _qnController = Get.put(QuestionController());

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
                child: TextFormField(
                      restorationId: 'name_field',
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        icon: Icon(Icons.person),
                        hintText: "type..",
                        labelText: "Username",
                      ),
                      onSaved: (value) {
                        _qnController.username = value!;
                      },
                    ),
              )
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const QuizScreen());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text("Start"))),
            ),
          ),
        ],
      ),
    ));
  }
}
