import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';

class PlayButton extends StatelessWidget {
  PlayButton({Key? key, this.onPressed}) : super(key: key);
  final void Function()? onPressed;
  final FunctionsController functionsController = Get.find();
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FunctionsController>(
      init: FunctionsController(),
      builder: (functionsController) {
        return GestureDetector(
          onPanEnd: (details) {
            scale = 1;
            functionsController.update();
          },
          onPanDown: (d) {
            scale = 0.9;
            functionsController.update();
          },
          onPanCancel: () {
            scale = 1;
            functionsController.update();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColor.withOpacity(0.15),
            ),
            width: 70,
            height: 70,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 150),
              scale: scale,
              child: SizedBox(
                width: 40,
                child: IconButton(
                  onPressed: onPressed ?? () {},
                  icon: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.play_arrow,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
