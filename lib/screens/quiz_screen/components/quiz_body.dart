import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/configs/themes/app_colors.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/utils/size_config.dart';

import 'card_with_answers.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: <Widget>[
        SvgPicture.asset(
          'assets/icons/bg.svg',
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<QuestionController>(
                  init: QuestionController(),
                  builder: (controller) => Container(
                    height: getProportionateScreenHeight(50),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(20)),
                      border:
                          Border.all(color: AppColors.kPrimaryColor, width: 3),
                    ),
                    child: Stack(
                      children: [
                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Container(
                              width: constraints.maxWidth *
                                  controller.animation!.value,
                              decoration: BoxDecoration(
                                gradient: AppColors.kPrimaryGradient,
                                borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(20),
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(10),
                                horizontal: getProportionateScreenWidth(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${(controller.animation!.value * 60).round()} sec'),
                                SvgPicture.asset(
                                  'assets/icons/clock.svg',
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    child: Obx(
                      () => Text.rich(
                        TextSpan(
                          text: 'Qustion ${_questionController.questionNumber}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: AppColors.kSecondaryColor),
                          children: [
                            TextSpan(
                              text: '/${_questionController.questions.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    color: AppColors.kSecondaryColor,
                                    fontSize: getProportionateScreenHeight(
                                      30,
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                const Divider(
                  thickness: 1.0,
                  color: AppColors.kSecondaryColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: _questionController.changeQuestionNumber,
                    physics: NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => CardWithAnswers(
                      controller: _questionController.questions[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
