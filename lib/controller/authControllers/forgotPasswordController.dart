import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/controller/functionsController/dialogsAndLoadingController.dart';
import 'package:work_out/config/text.dart';

class ForgotPasswordController extends GetxController {
  // Dependency injection
  FunctionsController controller = Get.put(FunctionsController());
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());

  // Text Editing controllers
  late TextEditingController emailToRecoverPassword;

  // Recover password method
  recoverPassword(String email) async {
    // Check if the email is valid
    bool isValidEmail = controller.emailRegExp.hasMatch(email);

    // if it's valid then

    // email != '' is optional but I can't remove it (it's called perfection sickness)
    if (isValidEmail && email != '') {
      try {
        // Show loading dialog
        dialogsAndLoadingController.showLoading();

        // Send request (no need to make independent instance)
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        // On success pop the loading dialog
        Get.back();

        // Show success to user
        dialogsAndLoadingController
            .showSuccess(controller.capitalize(AppTexts.emailVerifSentText));

        //
      } on FirebaseAuthException catch (e) {
        // on error too, pop the loading dialog first
        Get.back();

        // Error checks (if you want to be more specific make for each error a case) on this pattern
        if (e.code == "user-not-found") {
          dialogsAndLoadingController
              .showError(controller.capitalize(AppTexts.noUserText));
        }
        // here your checks
        else {
          dialogsAndLoadingController.showError("$e.message");
        }
      }
      // this is optional
      catch (e) {
        dialogsAndLoadingController.showError(e.toString());
      }
    }
    // email checks ()
    else if (email == "") {
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.enterEmail));
    } else if (!isValidEmail) {
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.enterValidEmail));
    }
  }

  @override
  void onInit() {
    // Inputs controllers declarations
    emailToRecoverPassword = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // Inputs controllers disposals
    emailToRecoverPassword.dispose();
    super.onClose();
  }
}
