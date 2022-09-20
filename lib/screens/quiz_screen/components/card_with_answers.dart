import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../../../configs/themes/app_colors.dart';
import '../../../models/questions.dart';
import '../../../utils/utils.dart';

class CardWithAnswers extends StatelessWidget {
  const CardWithAnswers({
    super.key,
    required this.controller,
  });

  final Question controller;

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      padding: EdgeInsets.all(getProportionateScreenHeight(20)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(getProportionateScreenHeight(20))),
      child: Column(
        children: [
          Text(
            controller.question,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.kBlackColor,
                fontSize: getProportionateScreenHeight(24),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          ...List.generate(
            controller.options.length,
            (index) => AnswerOption(
              press: () =>
                  questionController.checkRightAnswers(controller, index),
              textAnswer: controller.options[index],
              index: index,
            ),
          )
        ],
      ),
    );
  }
}

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    super.key,
    required this.index,
    required this.textAnswer,
    required this.press,
  });
  final int index;
  final String textAnswer;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (qnController.correctAnswer == index) {
                return AppColors.kGreenColor;
              } else if (qnController.selectedAnswer == index &&
                  qnController.correctAnswer != index) {
                return AppColors.kRedColor;
              }
            }
            return AppColors.kGrayColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == AppColors.kRedColor
                ? Icons.close
                : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10)),
              width: double.maxFinite,
              padding: EdgeInsets.all(getProportionateScreenHeight(15)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15),
                  border: Border.all(color: getTheRightColor())),
              child: Row(
                children: [
                  Text(
                    '${index + 1}. $textAnswer',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: getTheRightColor()),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  const Spacer(),
                  Container(
                    height: getProportionateScreenHeight(35),
                    width: getProportionateScreenWidth(35),
                    decoration: BoxDecoration(
                      color: getTheRightColor() == AppColors.kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      shape: BoxShape.circle,
                      border: Border.all(color: getTheRightColor()),
                    ),
                    child: getTheRightColor() == AppColors.kGrayColor ? null : Icon(getTheRightIcon(), color: Colors.white,),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
