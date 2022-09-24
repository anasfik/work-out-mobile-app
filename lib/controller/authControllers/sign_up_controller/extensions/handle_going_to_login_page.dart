import 'package:get/get.dart';

import '../../../../view/screens/auth/loginPage.dart';
import '../sign_up_controller.dart';

extension HandleGoingToLoginPageExtension on SignUpController {
  void handleGoingToLoginPage() {
    Get.previousRoute == "/GetStartedPage" ? Get.to(LoginPage()) : Get.back();
  }
}
