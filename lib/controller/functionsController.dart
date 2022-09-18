import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/filteredList/filteres.dart';
import '../config/text.dart';
import '../view/screens/homepage/componenets/ItemsSwitchTiles.dart';

class FunctionsController extends GetxController {
  // Variables
  double btnScaleValue = 1;

  // Showing elements UI delay
  int delay = 300;

  // email RegExp
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Capitalize Strings in sentences
  capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    // in case of last letter is " " it makes an error so first :
    if (text[text.length - 1] == " ") {
      return text.trim().split(' ').map((word) {
        return "${word[0].toUpperCase()}${word.substring(1)} ";
      }).join(' ');
    }
    //
    return text.split(' ').map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }

// Toggle filter dialog checkboxes
  List filterItems = filtersItemsFromFile;
  toggleValue(bool? val, int index) {
    // if the "All" option is checked, check all the others
    if (filterItems[index]["title"] == filterItems[0]["title"]) {
      filterItems.forEach((item) {
        item['isChecked'] = val;
      });
    }
    // Or check all others alone
    else {
      filterItems[index]['isChecked'] = val;
    }
    update();
  }

// Filter workout from map with property values and return one workout as map
  filterWorkoutWith(list, preperty, itsValue) {
    return (list.firstWhere((workOut) =>
            workOut[preperty] != null && workOut[preperty].contains(itsValue))
        as Map);
  }

// Filter workouts that match a property with it's value and return list of maps
  filteredListwith(list, preperty, itsValue) {
    return list
        .where((workOut) =>
            workOut[preperty] != null && workOut[preperty].contains(itsValue))
        .toList();
  }



  // Show filter dialog

  void showFilterDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            title: Text(AppTexts.filterBy),
            content: const ItemsCheckboxTiles(),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    Colors.grey[200],
                  ),
                ),
                child: Text(
                  AppTexts.cancel,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    Colors.grey[200],
                  ),
                ),
                onPressed: () {},
                child: Text(
                  AppTexts.apply,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        });
          
  }                 
}
