import 'package:get/get.dart';

import '../controller/functionsController.dart';

class WelcomePageBindings implements Bindings {
  @override
  void dependencies() {
    // Dependency injection
    Get.put<FunctionsController>(FunctionsController());
  }
}
