import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/inAppData/images%20sources.dart';
import 'package:work_out/inAppData/text.dart';

import '../../../controller/authControllers/loginController.dart';
import '../../../controller/functionsController.dart';
import '../../../inAppData/Colors.dart';
import '../../components/general componenets/button.dart';
import '../../components/general componenets/mainScreenTitle.dart';
import '../../components/general componenets/text field.dart';
import '../../components/general componenets/titleWithDescription.dart';
import 'SignUpPage.dart';
import 'forgotPassword.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  //depen. injection
  final FunctionsController controller = Get.put(FunctionsController());
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
               ImgSrc().randomFromAssetsList(),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.45, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.darkBlue,
                  AppColors.darkBlue.withOpacity(0.05),
                ],
              ),
            ),
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay),
                    child: MainScreenTitle(
                        mainWord: AppTexts.firstMainWord,
                        secondaryWord: AppTexts.secondaryMainWord),
                  ),
                  const SizedBox(height: 120),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 100),
                    child: TitleWithDescription(
                      title: controller.capitalize(AppTexts.signIn),
                      description:
                          AppTexts.loginDescription,
                    ),
                  ),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 200),
                    child: CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: loginController.loginEmailController,
                      label: controller.capitalize(AppTexts.email),
                    ),
                  ),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 300),
                    child: CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: loginController.loginPasswordController,
                      label: controller.capitalize(AppTexts.password),
                      obscureText: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: controller.delay + 300),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ForgotPasswordPage());
                          },
                          child: Text(
                            controller.capitalize(
                              AppTexts.forgetPassword,
                            ),
                            style: const TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      DelayedDisplay(
                        delay: Duration(milliseconds: controller.delay + 400),
                        child: CustomButton(
                          onPressed: () {
                            loginController.loginWithAccount(
                              loginController.loginEmailController.text.trim(),
                              loginController.loginPasswordController.text
                                  .trim(),
                            );
                          },
                          isRounded: false,
                          text: controller.capitalize(AppTexts.login),
                          isOutlined: false,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DelayedDisplay(
                        delay: Duration(milliseconds: controller.delay + 500),
                        child: CustomButton(
                          onPressed: () {
                            Get.to(() => SignUpPage());
                          },
                          isRounded: false,
                          text: controller.capitalize(AppTexts.signUp),
                          isOutlined: true,
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
