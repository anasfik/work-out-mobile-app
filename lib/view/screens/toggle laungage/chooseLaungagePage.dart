
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/config/Colors.dart';
import 'package:work_out/config/images%20sources.dart';
import 'package:work_out/config/text.dart';
import 'componenets/ChooseLaungageBox.dart';

class ChooseLaungagePage extends StatelessWidget {
  ChooseLaungagePage({Key? key}) : super(key: key);
  final FunctionsController controller = Get.put(FunctionsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DelayedDisplay(
              delay: Duration(milliseconds: controller.delay + 100),
              child: Center(
                child: Text(
                  controller.capitalize(AppTexts.chooseLaungage),
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: controller.delay + 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ChooseLaungageBox(
                    language: AppTexts.primaryLaungage,
                    languageImgPath: ImgSrc.primaryLaungage,
                  ),
                  ChooseLaungageBox(
                    language: AppTexts.secondaryLaungage,
                    languageImgPath: ImgSrc.secondaryLaungage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
