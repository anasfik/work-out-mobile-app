import 'package:get/get.dart';
import 'package:work_out/helpers/extension/set_extension.dart';

import '../../model/checked_get_started_card_info.dart';

class GetStartedController extends GetxController {
  Set<CheckedCard> checkedCardsIds = {};

  handelChangeInCheckedCardsList(CheckedCard checkedCard) {
    checkedCardsIds.addIfRemoveElse(
      checkedCard,
      checkedCard.isChecked,
      removeElse: !checkedCard.isChecked,
    );
    print(
      checkedCardsIds
          .map(
            (card) => card.hashCode,
          )
          .toList()
          .toString(),
    );
    update();
  }
}
