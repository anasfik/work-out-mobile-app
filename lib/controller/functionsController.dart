import 'package:get/get.dart';

import '../inAppData/filteredList/filteres.dart';

class FunctionsController extends GetxController {
  // variables
  double btnScaleValue = 1;
  // showing elements UI delay
  int delay = 300;
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");



  // capitalize Strings in sentences
  capitalize(String text) {
    // no end spaces in the text
    return text.split(" ").map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).join(" ");
  }


// toggle filter dialog checkboxes
  List filterItems = filtersItemsFromFile;
  toggleValue(bool? val, int index) {
    if (filterItems[index]["title"] == filterItems[0]["title"]) {
      filterItems.forEach((item) {
        item['isChecked'] = val;
      });
    } else {
      filterItems[index]['isChecked'] = val;
    }
    update();
  }

//filter workout from map with property values and return one workout as map
  filterWorkoutWith(list, preperty, itsValue) {
    return (list.firstWhere((workOut) =>
            workOut[preperty] != null && workOut[preperty].contains(itsValue))
        as Map);
  }
// filter workouts that match a property with it's value and return list of maps
  filteredListwith(list, preperty, itsValue) {
    return list
        .where((workOut) =>
            workOut[preperty] != null && workOut[preperty].contains(itsValue))
        .toList();
  }


}
