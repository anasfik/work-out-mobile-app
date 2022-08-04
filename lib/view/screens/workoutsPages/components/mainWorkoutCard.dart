import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/view/screens/homepage/componenets/playButton.dart';
import 'package:work_out/view/screens/work%20out%20details/componenets/RatingStars.dart';

import '../../../components/general componenets/actionButton.dart';
import '../../work out details/workOutDetails.dart';

class MainWorkoutCard extends StatelessWidget {
  MainWorkoutCard({
    Key? key,
    this.togglablesIcon = Icons.favorite_outline_outlined,
    required this.hasFreeTrial,
    required this.priceInDollars,
    required this.comments,
    required this.reviews,
    required this.durationInMinutes,
    required this.filledStars,
    required this.setsNumber,
    required this.movesNumber,
    required this.cardTitle,
    required this.sectionTitle,
    required this.imagePath,
    required this.description,
    required this.timeLeft,
    required this.isFavortite,
  }) : super(key: key);
  IconData togglablesIcon;
  String? imagePath,
      filledStars,
      timeLeft,
      cardTitle,
      sectionTitle,
      description,
      hasFreeTrial,
      priceInDollars,
      comments,
      reviews,
      durationInMinutes,
      setsNumber,
      movesNumber;
  final FunctionsController controller = Get.put(FunctionsController());
  bool isFavortite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            controller.capitalize(sectionTitle!),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 33,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 250,
            child: Text(
              controller.capitalize(description!),
              style: TextStyle(
                color: Colors.white.withOpacity(.8),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => WorkOutDetails(
                  workOutTitle: cardTitle ?? "?",
                  overlayedImg: imagePath ?? "?",
                  timeLeftInHour: timeLeft ?? "?",
                  movesNumber: movesNumber ?? "?",
                  setsNumber: setsNumber ?? "?",
                  durationInMinutes: durationInMinutes ?? "?",
                  rating: filledStars ?? "?",
                  description: description ?? "?",
                  reviews: reviews ?? "?",
                  comments: comments ?? "?",
                  priceInDollars: priceInDollars ?? "?",
                  hasFreeTrial: hasFreeTrial ?? "?",
                ));
          },
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 500,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(.8),
                        ],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                        stops: const [0, 0.8],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: PlayButton(),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.capitalize(cardTitle!),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RatingStars(
                            size: 22,
                            starsNumber: 5,
                            filledStars: int.parse(
                                filledStars != null ? filledStars! : "0"))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        controller.capitalize("$timeLeft hours"),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 20,
                    child: GetBuilder<FunctionsController>(
                        init: FunctionsController(),
                        builder: (controller) {
                          return ActionButton(
                            onTap: () {
                              isFavortite = !isFavortite;
                              if (isFavortite) {
                                togglablesIcon = Icons.favorite;
                              } else {
                                togglablesIcon =
                                    Icons.favorite_outline_outlined;
                              }
                              controller.update();
                            },
                            icon: Icon(togglablesIcon, color: Colors.red),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
