import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/inAppData/Colors.dart';

import '../../work out details/workOutDetails.dart';

class WorkOutCard extends StatelessWidget {
  WorkOutCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.listCollection,
    required this.index,
  }) : super(key: key);

  String title;
  String imagePath;
  List listCollection;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(WorkOutDetails(
          workOutTitle: title,
          overlayedImg: imagePath,
          timeLeftInHour: listCollection[index]["timeLeftInHour"] ?? "?",
          movesNumber: listCollection[index]["movesNumber"] ?? "?",
          setsNumber: listCollection[index]["setsNumber"] ?? "?",
          durationInMinutes: listCollection[index]["durationInMinutes"] ?? "?",
          rating: listCollection[index]["rating"] ?? "?",
          description: listCollection[index]["description"] ?? "?",
          reviews: listCollection[index]["reviews"] ?? "?",
          comments: listCollection[index]["comments"] ?? "?",
          priceInDollars: listCollection[index]["priceInDollars"] ?? "?",
          hasFreeTrial: listCollection[index]["hasFreeTrial"] ?? "?",
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: AppColors.darkBlue,
                width: 130,
                height: 130,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.75),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
