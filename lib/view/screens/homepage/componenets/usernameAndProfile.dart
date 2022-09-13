import 'package:flutter/material.dart';

import '../../../../inAppData/text.dart';
import 'avatar.dart';

class ProfileAndUsername extends StatelessWidget {
  ProfileAndUsername({
    Key? key,
    required this.username,
    required this.profileImg,
    this.onProfileImgTap,
  }) : super(key: key);

  String username;
  String profileImg;
  void Function()? onProfileImgTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: AppTexts.hey,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),
            children: [
              TextSpan(
                text: ' $username',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        Avatar(
          onProfileImgTap: onProfileImgTap,
          networkImage: profileImg,
        ),
      ],
    );
  }
}
