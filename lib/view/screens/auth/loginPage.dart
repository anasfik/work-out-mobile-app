import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/config/images%20sources.dart';
import 'package:work_out/config/show_delay_mixin.dart';
import 'package:work_out/config/text.dart';

import '../../../controller/authControllers/loginController.dart';
import '../../../controller/functionsController.dart';
import '../../../config/Colors.dart';
import '../../../helpers/string_methods.dart';
import '../../components/general componenets/button.dart';
import '../../components/general componenets/mainScreenTitle.dart';
import '../../components/general componenets/text field.dart';
import '../../components/general componenets/titleWithDescription.dart';
import 'sign_up_page.dart';
import 'forgotPassword.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  //depen. injection
  final FunctionsController controller = Get.put(FunctionsController());
  final LoginController loginController = Get.put(LoginController());

  //
  final DelayHelper delayHelper = DelayHelper();
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
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      DelayedDisplay(
                        delay: Duration(milliseconds: delay),
                        child: MainScreenTitle(
                            mainWord: AppTexts.firstMainWord,
                            secondaryWord: AppTexts.secondaryMainWord),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      DelayedDisplay(
                        delay: delayHelper.getDelayDuration(),
                        child: TitleWithDescription(
                          title: capitalize(AppTexts.signIn),
                          description: AppTexts.loginDescription,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DelayedDisplay(
                        delay: delayHelper.getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: loginController.loginEmailController,
                          label: capitalize(AppTexts.email),
                        ),
                      ),
                      DelayedDisplay(
                        delay: delayHelper.getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: loginController.loginPasswordController,
                          label: capitalize(AppTexts.password),
                          obscureText: true,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: DelayedDisplay(
                            delay: delayHelper.getDelayDuration(),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => ForgotPasswordPage());
                              },
                              child: Text(
                                capitalize(
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
                      const Spacer(
                        flex: 1,
                      ),
                      Column(
                        children: [
                          DelayedDisplay(
                            delay: delayHelper.getDelayDuration(),
                            child: CustomButton(
                              onPressed: () {
                                loginController.loginWithAccount(
                                  loginController.loginEmailController.text
                                      .trim(),
                                  loginController.loginPasswordController.text
                                      .trim(),
                                );
                              },
                              isRounded: false,
                              text: capitalize(AppTexts.login),
                              isOutlined: false,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DelayedDisplay(
                            delay: delayHelper.getDelayDuration(),
                            child: CustomButton(
                              onPressed: () {
                                Get.to(() => SignUpPage());
                              },
                              isRounded: false,
                              text: capitalize(AppTexts.signUp),
                              isOutlined: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
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
