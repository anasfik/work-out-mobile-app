import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/authControllers/SignUpController.dart';
import 'package:work_out/inAppData/Colors.dart';
import 'package:work_out/inAppData/text.dart';
import 'package:work_out/view/screens/auth/loginPage.dart';
import '../../../controller/functionsController.dart';
import '../../../inAppData/images sources.dart';
import '../../components/general componenets/button.dart';
import '../../components/general componenets/mainScreenTitle.dart';
import '../../components/general componenets/text field.dart';
import '../../components/general componenets/titleWithDescription.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  //depend. injection
  final FunctionsController controller = Get.put(FunctionsController());
  final additional signUpController = Get.put(additional());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              ImgSrc.login,
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
                        mainWord: AppTexts.firstMainWord, secondaryWord: AppTexts.secondaryMainWord),
                  ),
                  const SizedBox(height: 120),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 100),
                    child: TitleWithDescription(
                      title: controller.capitalize(AppTexts.signUp),
                      description:
                          AppTexts.signUpDescription,
                    ),
                  ),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 200),
                    child: CustomTextField(
                      keyboardType: TextInputType.name,
                      controller: signUpController.signUpUserController,
                      label: controller.capitalize(AppTexts.username),
                    ),
                  ),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 300),
                    child: CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: signUpController.signUpEmailController,
                      label: controller.capitalize(AppTexts.email),
                    ),
                  ),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 400),
                    child: CustomTextField(
                      keyboardType: TextInputType.text,
                      controller: signUpController.signUpPasswordController,
                      label: controller.capitalize(AppTexts.password),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      DelayedDisplay(
                        delay: Duration(milliseconds: controller.delay + 500),
                        child: CustomButton(
                          onPressed: () {
                            signUpController.newAccount(
                              signUpController.signUpEmailController.text
                                  .trim(),
                              signUpController.signUpPasswordController.text
                                  .trim(),
                              signUpController.signUpUserController.text.trim(),
                            );
                          },
                          isRounded: false,
                          text: controller.capitalize(AppTexts.signUp),
                          isOutlined: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      DelayedDisplay(
                        delay: Duration(milliseconds: controller.delay + 600),
                        child: GestureDetector(
                          onTap: () {
                            Get.previousRoute == "/GetStartedPage"
                                ? Get.to(LoginPage())
                                : Get.back();
                          },
                          child: Text(
                            controller.capitalize(AppTexts.alreadyHaveAnAccount),
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
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
