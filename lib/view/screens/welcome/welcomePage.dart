import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/inAppData/Colors.dart';
import 'package:work_out/inAppData/images%20sources.dart';
import 'package:work_out/inAppData/text.dart';
import 'package:work_out/view/components/general%20componenets/titleWithDescription.dart';
import 'package:work_out/view/screens/Get%20started/GetStartedPage.dart';
import 'package:work_out/view/screens/toggle%20laungage/chooseLaungagePage.dart';
import '../../../controller/functionsController.dart';
import '../../../inAppData/showDelayController.dart';
import '../../components/general componenets/button.dart';
import '../../components/general componenets/mainScreenTitle.dart';
import '../auth/loginPage.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  final FunctionsController controller = Get.put(FunctionsController());
  final delayHelper = DelayHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              ImgSrc().randomFromAssetsList(),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: AppColors.darkBlue.withOpacity(0.69),
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Hard Element MainScreenTitle
                  DelayedDisplay(
                    delay: delayHelper.getDelayDuration(),
                    child: MainScreenTitle(
                      mainWord: AppTexts.firstMainWord,
                      secondaryWord: AppTexts.secondaryMainWord,
                    ),
                  ),

                  const Spacer(
                    flex: 2,
                  ),
                  // Screen TitleWithDescription
                  DelayedDisplay(
                    delay: delayHelper.getDelayDuration(),
                    child: TitleWithDescription(
                      title: controller.capitalize(AppTexts.welcome),
                      description: AppTexts.welcomeDescription,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),

                  // Buttons, change Language text
                  Column(
                    children: [
                      // Get Started button
                      DelayedDisplay(
                        delay: delayHelper.getDelayDuration(),
                        child: CustomButton(
                          onPressed: () {
                            Get.to(GetStartedPage());
                          },
                          text: controller.capitalize(AppTexts.getStarted),
                          isOutlined: false,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Login Button
                      DelayedDisplay(
                        delay: delayHelper.getDelayDuration(),
                        child: CustomButton(
                          onPressed: () {
                            Get.to(LoginPage());
                          },
                          text: controller.capitalize(AppTexts.login),
                          isOutlined: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Change Language txt
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ChooseLaungagePage());
                          },
                          child: DelayedDisplay(
                            delay: delayHelper.getDelayDuration(),
                            child: Text(
                              AppTexts.changeLaungage,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
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
