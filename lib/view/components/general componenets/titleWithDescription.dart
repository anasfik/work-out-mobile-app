import 'package:flutter/material.dart';


class TitleWithDescription extends StatelessWidget {
  TitleWithDescription({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  String title;
  String description;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 250,
        child: RichText(
            text: TextSpan(
          text: '$title \n',
          style: const TextStyle(
                height: 1.4,
            letterSpacing: 1,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: description,
              style: const TextStyle(
                 letterSpacing: 0,
                  fontSize: 14,
                  color: Colors.white,
              )
            ),
          ],
        )),
      ),
    );
  }
}
