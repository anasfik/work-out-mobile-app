import 'package:get/get.dart';

import '../controller/authControllers/sign_up_controller/sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }
}
