import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quizz/network/webapi.dart';

import '../network/result.dart';
import '../screens/score/score.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  var isLoading = true.obs;

  Animation get animation => _animation;

  late PageController _pageController;

  PageController get pageController => _pageController;

  List<QuestionItem> _questions = [];

  List<QuestionItem> get questions => _questions;

  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;

  late String _correctAns;

  String get correctAns => _correctAns;

  late String _selectedAns;

  String get selectedAns => _selectedAns;

  late int _selectedIdx;

  int get selectedIdx => _selectedIdx;

  final RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => _numOfCorrectAns;

  get results => null;

  var name = "Geovani".obs;

  changeName(String s) {
    name.value = s;
  }

  @override
  void onInit() {
    fetchProducts();

    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void fetchProducts() async {
    isLoading(true);
    await RemoteServices()
        .fetchQuestions(5)
        .then((value) => {_questions = value});
    isLoading(false);
  }

  void checkAns(QuestionItem question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.correctAnswer!;
    _selectedAns = question.allAnswers[selectedIndex].toString();
    _selectedIdx = selectedIndex;

    if (_selectedAns == _correctAns) _numOfCorrectAns++;
    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(() => ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
