
import 'package:get/get.dart';

import '../../model/checked_get_started_card_info.dart';

class GetStartedController extends GetxController {
  Set<CheckedCard> checkedCardsIds = {};

  handelChangeInCheckedCardsList(CheckedCard checkedCard) {
    checkedCardsIds.addIf(checkedCard.isChecked, checkedCard);
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
