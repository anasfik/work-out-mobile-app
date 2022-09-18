import 'package:get/get.dart';
import 'package:work_out/view/screens/welcome/welcomePage.dart';

// To-do: add routes to all screens, ad make the change over the screens
class Routes {
  static final List<GetPage> pages = [
    GetPage(
      name: "/",
      page: () => WelcomePage(),
    ),
  ];
}
