import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:work_out/view/screens/welcome/welcomePage.dart';

import '../../view/screens/homepage/homePage.dart';

class NewAuthStateChangeListener extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User?> user = Rxn<User?>(null);

  @override
  void onReady() {
    ever(user, handleTheUserState);

    user.bindStream(_auth.authStateChanges());
    super.onReady();
  }

  handleTheUserState(User? user) {
    if (user == null) {
      print("no user / user is signed out");
      Get.offAll(WelcomePage());
    } else {
      print("user is signed in");
      Get.offAll(const HomePage());
    }
  }
}
