import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/routes/route_helper.dart';

import '../models/questions.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? _animationController;

  Animation? _animation;
  Animation? get animation => _animation;

  PageController? _pageController;
  PageController? get pageController => _pageController;

  final List<Question> _questions = sample_data
      .map((question) => Question(
          id: question['id'],
          question: question['question'],
          answer: question['answer_index'],
          options: question['options']))
      .toList();
  List<Question> get questions => _questions;

  String? _userName;
  String? get userName => _userName;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int? _selectedAnswer;
  int? get selectedAnswer => _selectedAnswer;

  int? _correctAnswer;
  int? get correctAnswer => _correctAnswer;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfRightAnswers = 0;
  int get numOfrightAnswers => _numOfRightAnswers;
  @override
  void onInit() {
    super.onInit();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!)
      ..addListener(() {
        update();
      });

    _animationController!.forward().whenComplete(nextQuestion);

    _pageController = PageController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _pageController!.dispose();
    _animationController!.dispose();
  }

  void checkRightAnswers(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) {
      _numOfRightAnswers++;
    }
    _animationController!.stop();
    update();

    Future.delayed(const Duration(seconds: 3), () => nextQuestion());
  }

  void addNewUser(String name) {
    _userName = name;
    update();
    _animationController!.reset();

    _animationController!.forward();
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController!.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.easeOut);

      _animationController!.reset();

      _animationController!.forward().whenComplete(nextQuestion);
    } else {
      Get.toNamed(RouteHelper.scoreScreen);
    }
  }

  void restartTest() {
    Get.toNamed(RouteHelper.initialScreen);
  }

  void changeQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }

  String showTextResult() {
    if (_numOfRightAnswers <= _questions.length / 3) {
      return '$userName,  You could be better...';
    } else if (_numOfRightAnswers <= _questions.length / 2) {
      return '$userName, You have done good job!';
    } else if (_numOfRightAnswers >= _questions.length / 1 / 3) {
      return '$userName,  You have done great job!';
    }
    return '';
  }
}
