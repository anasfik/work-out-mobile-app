
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';

class Stat extends StatelessWidget {
  Stat({
    Key? key,
    required this.statTitle,
    required this.statValue,
  }) : super(key: key);

  final FunctionsController controller = Get.put(FunctionsController());
  String statTitle, statValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          statValue,
          style: const TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          statTitle,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }
}
