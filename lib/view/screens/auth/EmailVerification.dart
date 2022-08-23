import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/authControllers/signOutController.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/inAppData/images%20sources.dart';
import 'package:work_out/inAppData/text.dart';
import 'package:work_out/view/components/general%20componenets/button.dart';

import '../../../controller/authControllers/emailVerficationController.dart';

class EmailVerificatioPage extends StatelessWidget {
  EmailVerificatioPage({Key? key}) : super(key: key);
  //depend. injection
  final FunctionsController controller = Get.put(FunctionsController());
  final EmailVerificatioController emailVerificatioController =
      Get.put(EmailVerificatioController());
  final SignOutController signOutController = Get.put(SignOutController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131429),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {
                  signOutController.signOut();
                },
                child: const Text("sign out test"),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 22, 23, 43),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(30),
                width: double.infinity,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Image.asset(ImgSrc.imgVerification),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        AppTexts.emailSentText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                  text: controller.capitalize(AppTexts.done),
                  isOutlined: false,
                  onPressed: () {
                    emailVerificatioController.checkEmailVerified();
                  }),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  emailVerificatioController.sendVerificationEmail();
                },
                child: Text(
                  controller.capitalize(AppTexts.reSendEmailVerification),
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
