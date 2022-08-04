import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
      // variables
        late TabController workOutTabController;

      //tabs to show
  final List<Tab> workOutTabs = <Tab>[
    const Tab(text: "All"),
    const Tab(text: "Popular"),
    const Tab(text: 'Hard workout'),
    const Tab(text: 'Full body'),
    const Tab(text: 'Crossfit'),
  ];


  @override
  void onInit() {
    super.onInit();
    workOutTabController = TabController(vsync: this, length: workOutTabs.length);
  }

  @override
  void onClose() {
    workOutTabController.dispose();
    super.onClose();
  }
}
