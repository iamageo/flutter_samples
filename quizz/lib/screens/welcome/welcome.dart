import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizz/screens/quiz/quiz_screen.dart';

import '../../constants.dart';
import '../../controller/question_controller.dart';

class Welcome extends StatelessWidget {
  final QuestionController _qnController = Get.put(QuestionController());
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            const Spacer(), //2/6
            Expanded(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/meteor.svg",
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                "Meteor Quiz",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: kSecondaryColor),
              ),
            ), // 1/6
            Expanded(
              child: Center(
                  child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              )),
            ),
            const Spacer(), // 1/6
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  final String name = _nameController.text;
                  _qnController.changeName(name);
                  Get.to(() => const QuizScreen());
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                  // 15
                  decoration: const BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const Text("Start quizz"),
                ),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      )),
    );
  }
}
