import 'package:get/get.dart';

import '../controller/get_started_controller/get_started_controller.dart';

class GetStartedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStartedController>(() => GetStartedController());
  }
}
