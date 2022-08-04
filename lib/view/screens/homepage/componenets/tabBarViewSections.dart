import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/inAppData/images%20sources.dart';

import '../../../../inAppData/text.dart';
import '../../workoutsPages/AllWorkoutsPage.dart';
import 'WorkOutCard.dart';

class TabBarViewSection extends StatelessWidget {
  TabBarViewSection({
    Key? key,
    required this.title,
    required this.dataList,
    this.itemsToShow = 3,
    this.hasSeeAllButton = true,
  }) : super(key: key);
  String title;
  List dataList;
  bool hasSeeAllButton;
  int itemsToShow;
  final FunctionsController controller = Get.put(FunctionsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(AllWorkoutsPage(), arguments: [title, dataList]);
              },
              child: Visibility(
                visible: hasSeeAllButton,
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(.1),
                  ),
                  child: Text(
                    controller.capitalize(AppTexts.seeAll),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: [
              ...List.generate(
                itemsToShow < dataList.length ? 3 : dataList.length,
                (index) => WorkOutCard(
                    index: index,
                    listCollection: dataList,
                    title: controller.capitalize(
                      dataList[index]["workOutTitle"] ?? AppTexts.somethingWrong,
                    ),
                    imagePath: dataList[index]["imagePath"] ??
                        ImgSrc.noImgAvailable),
              )
            ],
          ),
        )
      ],
    );
  }
}
