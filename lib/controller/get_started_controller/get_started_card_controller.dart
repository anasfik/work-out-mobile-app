import 'package:get/get.dart';
import 'package:work_out/model/checked_get_started_card_info.dart';

import 'get_started_controller.dart';

class GetStartedCardController extends GetxController {
  GetStartedCardController(
    this.id,
  );
// Variables
  bool isTappedDown = false;
  bool isChecked = false;
  bool? previousIsChecked;
  final int id;
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
    // update(
    //   null,
    //   previousIsChecked != isChecked,
    // );

    updateWithCallback(
      Get.find<GetStartedController>().handelChangeInCheckedCardsList(
        CheckedCard(
          id: id,
          isChecked: isChecked,
        ),
      ),
      null,
      previousIsChecked != isChecked,
    );
  }

  
}













extension on GetStartedCardController {
  void updateWithCallback(
    dynamic callback, [
    List<Object>? ids,
    bool condition = true,
  ]) {
    if (!condition) {
      return;
    }
    callback;

    if (ids == null) {
      refresh();
    } else {
      for (final id in ids) {
        refreshGroup(id);
      }
    }
  }
}
