import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';

import '../controller/authControllers/newAuthStateChangeListener.dart';
import '../controller/functionsController/dialogsAndLoadingController.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // inject the auth changes listener controller
    Get.put<NewAuthStateChangeListener>(NewAuthStateChangeListener());
    Get.put<FunctionsController>(FunctionsController(), permanent: true);
    Get.put<DialogsAndLoadingController>(DialogsAndLoadingController());
  }
}
