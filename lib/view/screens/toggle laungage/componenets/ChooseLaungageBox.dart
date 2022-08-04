import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';

class ChooseLaungageBox extends StatelessWidget {
  ChooseLaungageBox({
    Key? key,
    required this.language,
    required this.languageImgPath,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
  }) : super(key: key);
  String language, languageImgPath;
  Color borderColor, textColor;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FunctionsController>(
        init: FunctionsController(),
        builder: (controller) {
          return GestureDetector(
            onPanStart: (details) {
              borderColor = Theme.of(context).primaryColor;
              textColor = Theme.of(context).primaryColor;
              controller.update();
            },
            onPanEnd: (details) {
              borderColor = Colors.transparent;
              textColor = Colors.white;

              controller.update();
            },
            child: Container(
              width: 120,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ),
                color: const Color.fromARGB(255, 16, 17, 34),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Image.asset(languageImgPath),
                  ),
                  Text(
                    language.toUpperCase(),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
