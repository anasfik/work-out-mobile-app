import 'package:get/get.dart';

import '../controller/authControllers/SignUpController.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }
}
