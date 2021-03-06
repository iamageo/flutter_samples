import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizz/screens/quiz/progress_bar.dart';
import 'package:quizz/screens/quiz/question_card.dart';

import '../../constants.dart';
import '../../controller/question_controller.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          FlatButton(onPressed: _questionController.nextQuestion, child: const Text("Skip")),
        ],
      ),
      body: Obx(() {
        if (_questionController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return buildQuestion(_questionController, context);
        }
      }),
    );
  }

  Column buildQuestion(
      QuestionController _questionController, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ProgressBar(),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => Text.rich(
              TextSpan(
                text: "Question ${_questionController.questionNumber.value}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
                children: [
                  TextSpan(
                    text: "/${_questionController.questions.length}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: kSecondaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(thickness: 1.5),
        const SizedBox(height: 16),
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _questionController.pageController,
            onPageChanged: _questionController.updateTheQnNum,
            itemCount: _questionController.questions.length,
            itemBuilder: (context, index) =>
                QuestionCard(question: _questionController.questions[index]),
          ),
        ),
      ],
    );
  }
}
