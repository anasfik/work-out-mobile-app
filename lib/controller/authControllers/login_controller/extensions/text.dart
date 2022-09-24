import 'package:flutter/widgets.dart';
import 'package:work_out/controller/authControllers/login_controller/login_controller.dart';

extension TextEditingCtrlLifeCycleExt on LoginController {
  // This will dispose the text editing controller
  void _disposeTextEditingControllers() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }

  void _initializeTextEditingControllers() {
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
  }

  /// this will initialize the text editing controllers
  void Function() get initializeTextEditingControllers =>
      _initializeTextEditingControllers;

  /// this will dispose the text editing controllers
  void Function() get disposeTextEditingControllers =>
      _disposeTextEditingControllers;
}
