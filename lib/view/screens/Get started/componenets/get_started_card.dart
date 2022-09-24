import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/config/Colors.dart';

import '../../../../controller/get_started_controller/get_started_card_controller.dart';
import '../../../../helpers/string_methods.dart';
import '../../../components/general componenets/CheckMark.dart';
import 'I_am_title.dart';

class GetStartedCard extends GetView<GetStartedCardController> {
  const GetStartedCard({
    super.key,
    required this.text,
    required this.description,
    required this.id,
  });

  final String text, description;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetStartedCardController>(
      init: GetStartedCardController(id),
  
      global: false,
      builder: (controller) {
        return GestureDetector(
          onPanDown: (details) {
            controller.panDownMethod();
          },
          onPanEnd: (details) {
            controller.panEndCancel();
          },
          onPanCancel: () {
            controller.panEndCancel();
          },
          onTap: () {
            controller.toggleIsChecked();
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
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
                    isTappedDown: controller.isTappedDown,
                    opacity: 1,
                    isChecked: controller.isChecked,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IamTitle(
                    text: capitalize(text),
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
