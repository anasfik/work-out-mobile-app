import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/controller/functionsController/dialogsAndLoadingController.dart';
import 'package:work_out/inAppData/text.dart';

class ForgotPasswordController extends GetxController {
  FunctionsController controller = Get.put(FunctionsController());
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());
  TextEditingController emailToRecoverPassword = TextEditingController();

  recoverPassword(String email) async {
    bool isValidEmail = controller.emailRegExp.hasMatch(email);

    if (email == "") {
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.enterEmail));
    } else if (!isValidEmail) {
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.enterValidEmail));
    } else if (isValidEmail && email != '') {
      try {
        dialogsAndLoadingController.showLoading();
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        Get.back();
        dialogsAndLoadingController.showSuccess(controller.capitalize(
            AppTexts.emailVerifSentText));
      } on FirebaseAuthException catch (e) {
        Get.back();
        if (e.code == "user-not-found") {
          dialogsAndLoadingController.showError(
              controller.capitalize(AppTexts.noUserText));
        } else {
          dialogsAndLoadingController.showError("$e.message");
        }
      } catch (e) {
        dialogsAndLoadingController.showError(e.toString());
      }
    }
  }

}
