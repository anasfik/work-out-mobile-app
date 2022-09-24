import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/authControllers/login_controller/extensions/text.dart';

import '../../functionsController/dialogsAndLoadingController.dart';

class LoginController extends GetxController {
  // Inputs controllers
  late TextEditingController loginEmailController;
  late TextEditingController loginPasswordController;

  // Depen. injection
  DialogsAndLoadingController dialogsAndLoadingController = Get.find();

// TODO: implement show/hide for the password field
//   // showPassword(bool obscureText) {
//   //   obscureText = false;
//   //   update();
//   // }

  @override
  void onInit() {
    initializeTextEditingControllers();
    super.onInit();
  }

  @override
  void onClose() {
    disposeTextEditingControllers();
    super.onClose();
  }
}
