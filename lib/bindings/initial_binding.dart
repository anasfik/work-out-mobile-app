import 'package:get/get.dart';

import '../controller/authControllers/newAuthStateChangeListener.dart';

class InitialBinding implements Bindings {

  @override
  void dependencies() {

  // inject the auth changes listener controller
  Get.put<NewAuthStateChangeListener>(NewAuthStateChangeListener());
  }
}