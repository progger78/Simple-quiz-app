import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/utils.dart';

import '../../controllers/question_controller.dart';
import 'components/quiz_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: TextButton(
              onPressed: () => questionController.nextQuestion(),
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenHeight(24)),
              ),
            ),
          )
        ],
      ),
      body: const QuizBody(),
    );
  }
}
