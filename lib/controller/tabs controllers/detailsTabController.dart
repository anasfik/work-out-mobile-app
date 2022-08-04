

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
      //variables
        late TabController detailsTabController;

      // tabs to show
  final List<Tab> detailsTabs = <Tab>[
    const Tab(text: "Description"),
    const Tab(text: "Reviews"),
    const Tab(text: 'Comments'),
  ];


  @override
  void onInit() {
    super.onInit();
    detailsTabController =
        TabController(vsync: this, length: detailsTabs.length);
  }

  @override
  void onClose() {
    detailsTabController.dispose();
    super.onClose();
  }
}
