import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz_screen/quiz_screen.dart';
import 'package:quiz_app/screens/score_screen/score_screen.dart';
import 'package:quiz_app/screens/welcome_screen/welcome_screen.dart';


class RouteHelper {
  static const String initialScreen = '/';
  static const String quizScreen = '/quiz-screen';
  static const String scoreScreen = '/score-screen';
  static const String authScreen = '/auth-screen';

  static const String addUserInfoScreen = '/add-user-info-screen';

  static const String userProfileScreen = '/user-profile-screen';


  static getInitial() => initialScreen;
  // static getDetailMovieScreen(pageId) => '$detailMovieScreen?pageId=$pageId';

  // static const String forgotPasswordScreen = '/forgot-password-screen';
  // static const String signInScreen = '/sign-in-screen';
  // static const String signUpScreen = '/sign-up-screen';
  // static const String otpScreen = '/otp-screen';
  // static const String completeProfileScreen = '/complete-profile-screen';
  // static const String loginSuccessfulScreen = '/login-successful-screen';
  // static const String userProductScreen = '/user-product-screen';
  // static const String editProductScreen = '/edit-product-screen';

  // static getDetailProductScreen(int pageId) =>
  //     '$detailProductScreen?pageId=$pageId';

  // static getCompleteProfileScreen() => completeProfileScreen;
  // static getSignInScreen() => signInScreen;
  // static getOtpScreen() => otpScreen;
  // static getEditProductScreen(int? pageId) =>
  //     '$editProductScreen?pageId=$pageId';

  static List<GetPage> pages = [
    GetPage(
        name: initialScreen,
        transition: Transition.fadeIn,
        page: () {
          return const WelcomeScreen();
        }),
  
    GetPage(
        name: quizScreen,
        transition: Transition.fadeIn,
        page: () {
          return const QuizScreen();
    }),
    GetPage(
        name: scoreScreen,
        transition: Transition.fadeIn,
        page: () {
          return const ScoreScreen();
        }),
    // GetPage(
    //     name: completeProfileScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const CompletProfileScreen();
    //     }),
    // GetPage(
    //     name: otpScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const OtpScreen();
    //     }),
    // GetPage(
    //     name: homeScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const HomeScreen();
    //     }),
    // GetPage(
    //     name: mainProdScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const MainProducrScreen();
    //     }),
    // GetPage(
    //     name: detailProductScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       return DetailProductScreen(
    //         pageId: int.parse(pageId!),
    //       );
    //     }),
    // GetPage(
    //     name: cartScreen,
    //     transition: Transition.fadeIn,
    //     page: () {
    //       return const CartScreen();
    //     })
  ];
}
