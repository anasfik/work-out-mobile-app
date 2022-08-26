import 'package:flutter/material.dart';

class MainScreenTitle extends StatelessWidget {
  const MainScreenTitle({
    Key? key,
    required this.mainWord,
    required this.secondaryWord,
    this.mainWordColor,
    this.secondaryWordColor,
  }) : super(key: key);

  final String mainWord, secondaryWord;
  final Color? mainWordColor, secondaryWordColor;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: mainWord.toUpperCase(),
          style: TextStyle(
            letterSpacing: 3,
            fontSize: 30,
            color: mainWordColor ?? Theme.of(context).primaryColor,
          ),
          children: [
            const TextSpan(text: " "),
            TextSpan(
              text: secondaryWord.toUpperCase(),
              style: TextStyle(
                fontSize: 30,
                color: secondaryWordColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
