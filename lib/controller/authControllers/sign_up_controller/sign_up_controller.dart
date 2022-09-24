import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/authControllers/sign_up_controller/extensions/text_editing_controller_lifecycle.dart';
import '../../functionsController/dialogsAndLoadingController.dart';

class SignUpController extends GetxController {
  final DialogsAndLoadingController dialogsAndLoadingController = Get.find();
  // Get moment time (in this case, get more info about user)
  FieldValue thisMomentTime = FieldValue.serverTimestamp();




  // Input controllers
  late TextEditingController signUpUserController,
      signUpEmailController,
      signUpPasswordController;

  @override
  void onInit() {
    initializeTextEditingControllers();
    super.onInit();
  }

  @override
  void onClose() {
    disposeTextEditingControllers();
    super.onClose();
  }
}
