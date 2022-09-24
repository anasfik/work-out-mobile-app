import 'package:get/get.dart';

import '../controller/authControllers/login_controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
