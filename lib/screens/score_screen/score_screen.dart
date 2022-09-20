import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/configs/themes/app_colors.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/utils/utils.dart';
import 'package:quiz_app/widgets/custom_app_button.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    QuestionController questionController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/icons/bg.svg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Text(
                  'Total Score',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.kSecondaryColor),
                ),
                const Spacer(),
                Text(
                  '${questionController.numOfrightAnswers * 10}/ ${questionController.questions.length * 10}',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.kSecondaryColor),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  textAlign: TextAlign.center,
                  questionController.showTextResult(),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.kSecondaryColor),
                ),
                 const Spacer(
                  flex: 1,
                ),
                CustomAppButton(
                    press: () => questionController.restartTest(),
                    text: 'Try Again',
                    textColor: Colors.white),
                    const Spacer(flex:2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
