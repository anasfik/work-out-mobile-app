
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/inAppData/text.dart';
import 'package:work_out/view/screens/homepage/homePage.dart';

import '../functionsController/dialogsAndLoadingController.dart';

class EmailVerificatioController extends GetxController {
  // variables
  User? user = FirebaseAuth.instance.currentUser;


  // depen. injection
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());
  FunctionsController controller = Get.put(FunctionsController());

// send email verification
  sendVerificationEmail() async {
    if (user != null) {
  
      await user!.sendEmailVerification();
    }
    Get.back();
  }

// check email if it s verified by user
  checkEmailVerified() async {
    dialogsAndLoadingController.showLoading();
// reload data under the hood to re-check of validity
    await FirebaseAuth.instance.currentUser?.reload();
    bool? emailVerifiedAfterReload =
        FirebaseAuth.instance.currentUser?.emailVerified;

    if (emailVerifiedAfterReload == true) {
      dialogsAndLoadingController.showLoading();

// updating in firestore
      await FirebaseFirestore.instance
          .collection("aboutUsers")
          .doc(user!.uid)
          .update({
        "verified": emailVerifiedAfterReload,
      });
      Get.back();
      Get.offAll(
        () => const HomePage(),
      );
    } else if (user!.emailVerified == false) {
      Get.back();
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.pleaseVerifyEmail));
    }
  }

  @override
  void onInit() {
    sendVerificationEmail();
    super.onInit();
  }

  @override
  void onReady() {
    dialogsAndLoadingController.showLoading();
    super.onReady();
  }
}
