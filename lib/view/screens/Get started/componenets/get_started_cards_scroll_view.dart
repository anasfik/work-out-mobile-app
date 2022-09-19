import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:work_out/view/screens/Get%20started/componenets/GetStartedCard.dart';

import '../../../../config/getStarted/getStartedData.dart';

class GetStartedCardsScrollView extends StatelessWidget {
  const GetStartedCardsScrollView({
    super.key,
    required this.delay,
  });
  final Duration delay;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            ...List.generate(
              handledCardsList.length,
              (i) => DelayedDisplay(
                delay: delay,
                child: GetStartedCard(
                  text: handledCardsList[i].title,
                  description: handledCardsList[i].description,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
