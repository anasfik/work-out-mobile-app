import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/inAppData/text.dart';
import 'package:work_out/view/screens/homepage/homePage.dart';

import '../functionsController/dialogsAndLoadingController.dart';

class LoginController extends GetxController {
  // inputs controllers
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

// depen. injection
  FunctionsController controller = Get.put(FunctionsController());
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());
////////

// authenticate with firebase email/password method
  loginWithAccount(String email, String password) async {
    bool isValidEmail = controller.emailRegExp.hasMatch(email);
    bool isValidPassword = password.length >= 5;
    if (isValidEmail && isValidPassword) {
      try {
        dialogsAndLoadingController.showLoading();

        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        Get.off(const HomePage());
      } on FirebaseAuthException catch (e) {
        Get.back();
        if (e.code == 'network-request-failed') {
          dialogsAndLoadingController
              .showError(controller.capitalize(AppTexts.checkConnection));
        }
        if (e.code == 'user-not-found') {
          dialogsAndLoadingController.showError(AppTexts.noUserText);
        } else if (e.code == 'wrong-password') {
          dialogsAndLoadingController
              .showError(controller.capitalize(AppTexts.wrongPassword));
        } else {
          dialogsAndLoadingController.showError(e.code);
        }
      }
    }
    if (email.isEmpty) {
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.enterEmail));
    } else if (!isValidEmail) {
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.invalidEmail));
    } else if (password.isEmpty) {
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.enterPassword));
    } else if (!isValidPassword) {
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.passwordMustBe5AtLeast));
    }
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.onClose();
  }
}
