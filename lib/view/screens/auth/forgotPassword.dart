import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/config/Colors.dart';
import 'package:work_out/config/images%20sources.dart';
import 'package:work_out/config/text.dart';
import '../../../controller/authControllers/forgotPasswordController.dart';
import '../../../controller/functionsController.dart';
import '../../../helpers/string_methods.dart';
import '../../widgets/general_widgets/button.dart';
import '../../widgets/general_widgets/text field.dart';
import '../../widgets/general_widgets/titleWithDescription.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  //depend. injection
  final FunctionsController controller = Get.put(FunctionsController());
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                    delay: Duration(milliseconds: delay + 100),
                    child: TitleWithDescription(
                      title: capitalize(AppTexts.forgot),
                      description: capitalize(
                          AppTexts.forgotPasswordDesccription.toLowerCase()),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DelayedDisplay(
                    delay: Duration(milliseconds: delay + 200),
                    child: CustomTextField(
                      controller:
                          forgotPasswordController.emailToRecoverPassword,
                      keyboardType: TextInputType.emailAddress,
                      label: capitalize(AppTexts.yourEmail),
                    ),
                  ),
                  const SizedBox(height: 50),
                  DelayedDisplay(
                    delay: Duration(milliseconds: delay + 300),
                    child: CustomButton(
                      onPressed: () {
                        forgotPasswordController.recoverPassword(
                            forgotPasswordController
                                .emailToRecoverPassword.text);
                      },
                      isRounded: false,
                      text: capitalize(AppTexts.resetPassword),
                      isOutlined: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
