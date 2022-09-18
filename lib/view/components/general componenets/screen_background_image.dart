import 'package:flutter/material.dart';

import '../../../config/images sources.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    this.backgroundImage,
  }) : super(key: key);
  final String? backgroundImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        backgroundImage ?? ImgSrc().randomFromAssetsList(),
        fit: BoxFit.cover,
      ),
    );
  }
}
