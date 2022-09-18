import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:work_out/view/screens/auth/EmailVerification.dart';
import 'package:work_out/view/screens/welcome/welcome_page.dart';

import '../../view/screens/homepage/homePage.dart';

class NewAuthStateChangeListener extends GetxController {
  // Instance of the FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // An observable that can bu null
  Rxn<User?> user = Rxn<User?>(null);

  // Auth state handler
  handleTheUserState(User? user) {
    if (user == null) {
      // print("no user / user is signed out");
      Get.offAll(WelcomePage());
    } else {
      if (!user.emailVerified) {
        // print("user is signed in but not verified");
        Get.offAll(EmailVerificatioPage());
      } else {
        // print("user is signed in");
        Get.offAll(HomePage());
      }
    }
  }

  @override
  void onReady() {
    ever(user, handleTheUserState);

    user.bindStream(_auth.authStateChanges());
    super.onReady();
  }
}
