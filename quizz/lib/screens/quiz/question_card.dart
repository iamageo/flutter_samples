import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizz/network/result.dart';

import '../../constants.dart';
import '../../controller/question_controller.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({
    required this.question,
  }) : super();

  final QuestionItem question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question!,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.allAnswers.length,
            (index) => Option(
                index: index,
                text: question.allAnswers[index],
                press: () => {_controller.checkAns(question, index)}),
          ),
        ],
      ),
    );
  }
}
