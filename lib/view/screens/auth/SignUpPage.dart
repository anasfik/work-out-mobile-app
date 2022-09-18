import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/authControllers/SignUpController.dart';
import 'package:work_out/config/Colors.dart';
import 'package:work_out/config/text.dart';
import 'package:work_out/view/screens/auth/loginPage.dart';
import '../../../controller/functionsController.dart';
import '../../../config/images sources.dart';
import '../../../config/showDelayController.dart';
import '../../components/general componenets/button.dart';
import '../../components/general componenets/mainScreenTitle.dart';
import '../../components/general componenets/screen_background_image.dart';
import '../../components/general componenets/text field.dart';
import '../../components/general componenets/titleWithDescription.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  // Dependency injection
  final FunctionsController controller = Get.put(FunctionsController());
  final additional signUpController = Get.put(additional());
  //
  final DelayHelper delayHelper = DelayHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(
            backgroundImage: ImgSrc().randomFromAssetsList(),
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
                        delay: delayHelper.getDelayDuration(),
                        child: MainScreenTitle(
                            mainWord: AppTexts.firstMainWord,
                            secondaryWord: AppTexts.secondaryMainWord),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      DelayedDisplay(
                        delay: delayHelper.getDelayDuration(),
                        child: TitleWithDescription(
                          title: controller.capitalize(AppTexts.signUp),
                          description: AppTexts.signUpDescription,
                        ),
                      ),
                      DelayedDisplay(
                        delay: delayHelper.getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.name,
                          controller: signUpController.signUpUserController,
                          label: controller.capitalize(AppTexts.username),
                        ),
                      ),
                      DelayedDisplay(
                        delay: delayHelper.getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: signUpController.signUpEmailController,
                          label: controller.capitalize(AppTexts.email),
                        ),
                      ),
                      DelayedDisplay(
                        delay: delayHelper.getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.text,
                          controller: signUpController.signUpPasswordController,
                          label: controller.capitalize(AppTexts.password),
                          obscureText: true,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          DelayedDisplay(
                            delay: delayHelper.getDelayDuration(),
                            child: CustomButton(
                              onPressed: () {
                                signUpController.newAccount(
                                  signUpController.signUpEmailController.text
                                      .trim(),
                                  signUpController.signUpPasswordController.text
                                      .trim(),
                                  signUpController.signUpUserController.text
                                      .trim(),
                                );
                              },
                              isRounded: false,
                              text: controller.capitalize(AppTexts.signUp),
                              isOutlined: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DelayedDisplay(
                            delay: delayHelper.getDelayDuration(),
                            child: GestureDetector(
                              onTap: () {
                                Get.previousRoute == "/GetStartedPage"
                                    ? Get.to(LoginPage())
                                    : Get.back();
                              },
                              child: Text(
                                controller
                                    .capitalize(AppTexts.alreadyHaveAnAccount),
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
