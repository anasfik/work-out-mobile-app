
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:work_out/view/screens/homepage/homePage.dart';
import 'package:work_out/view/screens/welcome/welcomePage.dart';

class AuthChangesListener extends GetxController {
  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
       // print('User is currently signed out!');
        Get.to(() => WelcomePage());
        update();
      } else {
       // print('User is signed in!');
        Get.to(() => const HomePage());
        update();
      }
    });

    super.onInit();
  }
}
