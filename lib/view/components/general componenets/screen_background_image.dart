import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.backgroundImage,
  }) : super(key: key);

  final String backgroundImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        backgroundImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
