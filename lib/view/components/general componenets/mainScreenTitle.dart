import 'package:flutter/material.dart';
class MainScreenTitle extends StatelessWidget {
  MainScreenTitle(
      {Key? key, required this.mainWord, required this.secondaryWord})
      : super(key: key);

  String mainWord;
  String secondaryWord;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          text: mainWord.toUpperCase(),
          style: TextStyle(
            letterSpacing: 3,
            fontSize: 30,
            color: Theme.of(context).primaryColor,
          ),
          children: [
            TextSpan(
              text: ' $secondaryWord'.toUpperCase(),
              style: const TextStyle(
                 fontSize: 30,
                  color: Colors.white,
              )
            ),
          ],
        ),
      ),
    );
  }
}
