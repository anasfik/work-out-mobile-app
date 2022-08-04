
import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  RatingStars(
      {Key? key,
      this.size = 18,
      required this.starsNumber,
      required this.filledStars})
      : super(key: key);
  int starsNumber, filledStars;
  double size;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(starsNumber, (orderIndex) {
        return Container(
          margin: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.star,
            size: size,
            color: orderIndex < filledStars
                ? Colors.yellow
                : Colors.white.withOpacity(.45),
          ),
        );
      }),
    ]);
  }
}
