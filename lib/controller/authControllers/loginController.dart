import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/inAppData/text.dart';

import '../functionsController/dialogsAndLoadingController.dart';

class LoginController extends GetxController {
  // Inputs controllers
  late TextEditingController loginEmailController;
  late TextEditingController loginPasswordController;

  // Depen. injection
  FunctionsController controller = Get.put(FunctionsController());
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());

  // Authenticate with firebase email/password method
  loginWithAccount(String email, String password) async {
    // Validation booleans
    bool isValidEmail = controller.emailRegExp.hasMatch(email);
    bool isValidPassword = password.length >= 5;

    // Check first if they are valid to login directly
    if (isValidEmail && isValidPassword) {
      try {
        dialogsAndLoadingController.showLoading();

        // No need for making new instance since we use it one time
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // no need for popping the loading dialog since if it's working, the auth listener will do its work
      } on FirebaseAuthException catch (e) {
        // on error, first pop the loading dialog
        Get.back();

        // Errors checks (if you want to be more specific make for each error a case) on this pattern
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

    // Now, let's check if the inputs aren't valid
    // it describe itself
    if (email.isEmpty) {
      dialogsAndLoadingController.showError(
        controller.capitalize(AppTexts.enterEmail),
      );
    }
    //
    else if (!isValidEmail) {
      dialogsAndLoadingController.showError(
        controller.capitalize(AppTexts.invalidEmail),
      );
    }
    //
    else if (password.isEmpty) {
      dialogsAndLoadingController.showError(
        controller.capitalize(AppTexts.enterPassword),
      );
    }
    //
    else if (!isValidPassword) {
      dialogsAndLoadingController.showError(
        controller.capitalize(AppTexts.passwordMustBe5AtLeast),
      );
    }
  }

  @override
  void onInit() {
    // Inputs controllers declarations
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // Inputs controllers disposals
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.onClose();
  }
}
