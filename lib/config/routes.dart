import 'package:get/get.dart';
import 'package:work_out/view/screens/welcome/welcome_page.dart';

import '../bindings/get_started_binding.dart';
import '../bindings/login_binding.dart';
import '../bindings/welcome_binding.dart';
import '../view/screens/Get started/GetStartedPage.dart';
import '../view/screens/auth/loginPage.dart';

// To-do: add routes to all screens, ad make the change over the screens
class Routes {
  static final List<GetPage> pages = [
    GetPage(
      name: "/",
      page: () => WelcomePage(),
      binding: WelcomePageBindings(),
    ),
      GetPage(
      name: "/get_started",
      page: () => GetStartedPage(),
      binding: GetStartedBinding(),
    ),
        GetPage(
      name: "/login",
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
