import 'package:get/get.dart';
import 'package:work_out/view/screens/auth/sign_up_page.dart';
import 'package:work_out/view/screens/welcome/welcome_page.dart';

import '../bindings/forgot_password_binding.dart';
import '../bindings/get_started_binding.dart';
import '../bindings/login_binding.dart';
import '../bindings/sign_up_binding.dart';
import '../bindings/welcome_binding.dart';
import '../view/screens/Get started/get_started_page.dart';
import '../view/screens/auth/forgotPassword.dart';
import '../view/screens/auth/login_page.dart';

// To-do: add routes to all screens, ad make the change over the screens
class Routes {
  static final List<GetPage> pages = [
    GetPage(
      name: "/",
      page: () => WelcomePage(),
      binding: WelcomePageBinding(),
    ),
    GetPage(
      name: "/getStarted",
      page: () => GetStartedPage(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: "/signUp",
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: "/login",
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: "/forgotPassword",
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
