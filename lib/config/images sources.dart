// local Assets Imgs
import 'dart:math';

class ImgSrc {
  ImgSrc();

  List<String> imgList = <String>[
    ImgSrc.welcome,
    ImgSrc.getStarted,
    ImgSrc.login,
    ImgSrc.homepageOverlay,
  ];

  static String welcome = 'imgs/welcomeOverlayImg.png';
  static String getStarted = 'imgs/GetStartedOverlay.png';
  static String login = 'imgs/loginOverlayImg.png';
  static String primaryLaungage = "imgs/en.png";
  static String secondaryLaungage = "imgs/fr.png";
  static String imgVerification = "imgs/email_verif.png";
  static String homepageOverlay = 'imgs/welcomePageOverlay.png';

  static String noImgAvailable = "imgs/No_image_available.png";

  String randomFromAssetsList() {
    return imgList[Random().nextInt(imgList.length)];
  }
}
