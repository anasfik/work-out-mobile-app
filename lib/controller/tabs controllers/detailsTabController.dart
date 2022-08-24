import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // TabController
  late TabController detailsTabController;

  // Tabs to show
  final List<Tab> detailsTabs = <Tab>[
    const Tab(text: "Description"),
    const Tab(text: "Reviews"),
    const Tab(text: 'Comments'),
  ];

  @override
  void onInit() {
    
    // init on init hah
    detailsTabController =
        TabController(vsync: this, length: detailsTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    // dispose
    detailsTabController.dispose();
    super.onClose();
  }
}
