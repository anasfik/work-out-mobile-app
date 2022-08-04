import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../functionsController/dialogsAndLoadingController.dart';

class SignOutController extends GetxController {
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());
  // sign out from app
  signOut() async {
    try {
      dialogsAndLoadingController.showLoading();

      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      Get.back();
      dialogsAndLoadingController.showError("Error: ${e.code}");
    }
  }
}
