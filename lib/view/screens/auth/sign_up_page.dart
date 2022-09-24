import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/authControllers/sign_up_controller/extensions/create_new_account/create_new_account.dart';
import 'package:work_out/controller/authControllers/sign_up_controller/sign_up_controller.dart';
import 'package:work_out/config/Colors.dart';
import 'package:work_out/config/text.dart';
import 'package:work_out/view/screens/auth/loginPage.dart';
import '../../../config/show_delay_mixin.dart';
import '../../../helpers/string_methods.dart';
import '../../components/general componenets/button.dart';
import '../../components/general componenets/mainScreenTitle.dart';
import '../../components/general componenets/screen_background_image.dart';
import '../../components/general componenets/text field.dart';
import '../../components/general componenets/titleWithDescription.dart';

class SignUpPage extends GetView<SignUpController> with DelayHelperMixin {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
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
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: MainScreenTitle(
                            mainWord: AppTexts.firstMainWord,
                            secondaryWord: AppTexts.secondaryMainWord),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: TitleWithDescription(
                          title: capitalize(AppTexts.signUp),
                          description: AppTexts.signUpDescription,
                        ),
                      ),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.name,
                          controller: controller.signUpUserController,
                          label: capitalize(AppTexts.username),
                        ),
                      ),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.signUpEmailController,
                          label: capitalize(AppTexts.email),
                        ),
                      ),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.text,
                          controller: controller.signUpPasswordController,
                          label: capitalize(AppTexts.password),
                          obscureText: true,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          DelayedDisplay(
                            delay: getDelayDuration(),
                            child: CustomButton(
                              onPressed: () {
                                controller.createNewAccount(
                                  email: controller.signUpEmailController.text
                                      .trim(),
                                  password: controller
                                      .signUpPasswordController.text
                                      .trim(),
                                  username: controller.signUpUserController.text
                                      .trim(),
                                );
                              },
                              isRounded: false,
                              text: capitalize(AppTexts.signUp),
                              isOutlined: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DelayedDisplay(
                            delay: getDelayDuration(),
                            child: GestureDetector(
                              onTap: () {
                                Get.previousRoute == "/GetStartedPage"
                                    ? Get.to(LoginPage())
                                    : Get.back();
                              },
                              child: Text(
                                capitalize(AppTexts.alreadyHaveAnAccount),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
