import 'package:get/get.dart';

import '../../../../view/screens/auth/loginPage.dart';
import '../sign_up_controller.dart';

extension HandleGoingToLoginPageExtension on SignUpController {
  void handleGoingToLoginPage() {
    print(Get.previousRoute);
    Get.previousRoute == "/getStarted" ? Get.to(LoginPage()) : Get.back();
  }
}
