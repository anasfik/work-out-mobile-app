import 'package:get/get.dart';

class GetStartedCardController extends GetxController {
// Variables
  bool isTappedDown = false;
  bool isChecked = false;
  bool? previousIsChecked;
  void panDownMethod() {
    isTappedDown = true;
    update();
  }

  void panEndCancel() {
    isTappedDown = false;
    update();
  }

  void toggleIsChecked() {
    previousIsChecked = isChecked;

    isChecked = !isChecked;
    update(
      null,
      previousIsChecked != isChecked,
    );
  }
}
