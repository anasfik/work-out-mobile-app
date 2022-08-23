import 'package:get/get.dart';
import 'package:work_out/view/screens/welcome/welcomePage.dart';

class Routes {
  static final List<GetPage> pages = [
    GetPage(
      name: "/",
      page: () => WelcomePage(),
    ),
  ];
}
