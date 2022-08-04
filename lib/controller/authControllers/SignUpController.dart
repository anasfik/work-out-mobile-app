import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/inAppData/text.dart';
import 'package:work_out/view/screens/auth/EmailVerification.dart';
import '../functionsController/dialogsAndLoadingController.dart';

class SignUpController extends GetxController {
  // input controllers
  TextEditingController signUpUserController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  // depen. injection
  FunctionsController controller = FunctionsController();
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());
// variables
  User? user = FirebaseAuth.instance.currentUser;
  FieldValue thisMomentTime = FieldValue.serverTimestamp();

  // add aditional info to the firestore
  addMoreInformationsToDatabase(credential, email, password, username,
      profileImgPath, uid, isEmailVerified) async {
    await FirebaseFirestore.instance.collection("aboutUsers").doc(uid).set({
      "email": email,
      "password": password,
      "username": username,
      "profileImgPath": profileImgPath,
      "uid": credential.user!.uid,
      "verified": isEmailVerified,
      "createdAt": thisMomentTime,
    });
  }

// create new account
  newAccount(String email, password, username) async {
    // checker booleans(should stay here)
    bool isValidEmail = controller.emailRegExp.hasMatch(email);
    bool isValidPassword = password.length > 4;
    bool isAcceptedUsername = username.length > 4;

    if (isValidEmail && isValidPassword && isAcceptedUsername) {
      try {
        dialogsAndLoadingController.showLoading();
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        addMoreInformationsToDatabase(
          credential,
          email,
          password,
          username,
          // this is place of profileImgPath
          "",
          credential.user!.uid,
          FirebaseAuth.instance.currentUser?.emailVerified,
        );
        Get.to(() => EmailVerificatioPage());
      } on FirebaseAuthException catch (e) {
        Get.back();
        if (e.code == 'network-request-failed') {
          dialogsAndLoadingController.showError(AppTexts.checkConnection);
        }
        if (e.code == 'weak-password') {
          dialogsAndLoadingController.showError(
              controller.capitalize(AppTexts.weakPassword));
        } else if (e.code == 'email-already-in-use') {
          dialogsAndLoadingController
              .showError(controller.capitalize(AppTexts.emailAlreadyInUse));
        }
      } catch (e) {
        // print(e);
      }
    }
    if (username == "" || email.isEmpty || password == "") {
      dialogsAndLoadingController.showError(controller.capitalize(AppTexts.fillFields));
    } else if (!isAcceptedUsername) {
      dialogsAndLoadingController.showError(
          controller.capitalize(AppTexts.usernameMustBe5AtLeast));
    } else if (!isValidEmail) {
      dialogsAndLoadingController
          .showError(controller.capitalize(AppTexts.invalidEmail));
    } else if (!isValidPassword) {
      dialogsAndLoadingController.showError(
          controller.capitalize(AppTexts.passwordMustBe5AtLeast));
    }
  }

  @override
  void onClose() {
    signUpPasswordController.dispose();
    signUpEmailController.dispose();
    signUpUserController.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
