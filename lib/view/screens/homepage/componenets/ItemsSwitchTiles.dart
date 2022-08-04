import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';

class ItemsCheckboxTiles extends StatelessWidget {
  const ItemsCheckboxTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<FunctionsController>(
                init: FunctionsController(),
                builder: (controller) {
                  return Column(
                    children: [
                      ...List.generate(
                          controller.filterItems.length,
                          (indexOrder) => CheckboxListTile(
                              contentPadding: const EdgeInsets.all(0),
                              activeColor: Theme.of(context).primaryColor,
                              title: Text(
                                controller.filterItems[indexOrder]
                                    ['title'],
                              ),
                              value: controller.filterItems[indexOrder]
                                  ["isChecked"],
                              onChanged: (val) {
                                
                                controller.toggleValue(val, indexOrder);
                              }))
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
