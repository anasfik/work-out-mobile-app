import 'package:flutter/material.dart';

class IamTitle extends StatelessWidget {
  IamTitle({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      "I'm \n$text",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
