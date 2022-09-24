
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';

import '../../../helpers/string_methods.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    required this.isOutlined,
    this.isRounded = true,
    required this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  String text;
  bool isOutlined = false;
  bool isRounded = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FunctionsController>(
        init: FunctionsController(),
        builder: (controller) {
          return Transform.scale(
            scale: 1 * btnScaleValue,
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: isOutlined
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(isRounded ? 30 : 10),
                    ),
                    primary: isOutlined
                        ? Colors.transparent
                        : Theme.of(context).primaryColor,
                    onPrimary: Theme.of(context).primaryColor),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
