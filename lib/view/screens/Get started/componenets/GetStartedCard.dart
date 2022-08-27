import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/inAppData/Colors.dart';

import '../../../../controller/getStartedController/cardsList.dart';
import '../../../components/general componenets/CheckMark.dart';
import 'IamTitle.dart';

class GetStartedCard extends StatelessWidget {
  GetStartedCard({
    Key? key,
    required this.text,
    this.isChecked = false,
    required this.description,
  }) : super(key: key);
  final FunctionsController controller = Get.put(FunctionsController());
  final GetStartedController elementsListsDatacontroller =
      Get.put(GetStartedController());
  bool isChecked, isTappedDown = false;
  final String text, description;
  Color cardBorderColor = Colors.transparent;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetStartedController>(
      init: GetStartedController(),
      builder: (elementsListsDatacontroller) {
        return InkWell(
          onTapCancel: () {
            isTappedDown = isChecked = true;
            cardBorderColor = Colors.transparent;

            elementsListsDatacontroller.update();
          },
          onTapDown: (details) {
            cardBorderColor = isTappedDown ? Colors.transparent : Colors.green;
            isTappedDown = true;
            opacity = isTappedDown ? 0.5 : 1;
            elementsListsDatacontroller.update();
          },
          onTapUp: (details) {
            isTappedDown = !isTappedDown;
            opacity = 0.45;
            cardBorderColor = Colors.transparent;
            elementsListsDatacontroller.update();
          },
          onHighlightChanged: (val) {
            opacity = isChecked
                ? isTappedDown
                    ? 0
                    : 0.4
                : 1;

            elementsListsDatacontroller.update();
          },
          onTap: () {
            isChecked = !isChecked;
            isTappedDown = isChecked;
            isChecked
                ? elementsListsDatacontroller.checkedGetStartedCardsList
                    .add(text)
                : elementsListsDatacontroller.checkedGetStartedCardsList
                    .remove(text);

            elementsListsDatacontroller.update();
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: cardBorderColor.withOpacity(1),
              ),
              color: AppColors.darkBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 180,
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CheckMark(
                    isTappedDown: isTappedDown,
                    opacity: opacity,
                    isChecked: isChecked,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IamTitle(
                    text: controller.capitalize(text),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
