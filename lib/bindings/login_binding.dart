import 'package:get/get.dart';

import '../controller/authControllers/loginController.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
