import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedController extends GetxController {
// Variables
  bool isTappedDown = false;

  void panDownMethod() {
    isTappedDown = true;
    update();
  }

  void panEndCancel() {
    isTappedDown = false;
    update();
  }
}
