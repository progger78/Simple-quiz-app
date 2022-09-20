import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/configs/themes/app_colors.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/routes/route_helper.dart';
import 'package:quiz_app/utils/utils.dart';
import 'package:quiz_app/widgets/custom_app_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }

  void sumbitForm(controller) {
    if (_textController.text.isNotEmpty) {
      controller.addNewUser(_textController.text);
      Get.toNamed(RouteHelper.quizScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final QuestionController questionController = Get.put(QuestionController());
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Text(
              'Let\'s Play Quiz',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              'Fill your information bellow',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
            const Spacer(),
            TextField(
                controller: _textController,
                autofocus: true,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 44, 57, 130),
                    hintText: 'Input your name',
                    hintStyle: TextStyle(color: AppColors.kGrayColor))),
            const Spacer(),
            CustomAppButton(
              press: () => sumbitForm(questionController),
              text: 'Continue',
              textColor: Colors.white,
              color: AppColors.kSaphireColor,
            ),
            const Spacer(flex: 2)
          ],
        ),
      ),
    ));
  }
}
