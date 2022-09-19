import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:work_out/config/text.dart';
import 'package:work_out/view/screens/auth/EmailVerification.dart';
import '../../helpers/string_methods.dart';
import '../functionsController/dialogsAndLoadingController.dart';

class additional extends GetxController {
  // Input controllers
  TextEditingController signUpUserController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  // Depen. injection
  FunctionsController controller = FunctionsController();
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());

  // Variables
  // user instance,
  User? user = FirebaseAuth.instance.currentUser;

  // Get moment time (in this case, get more info about user)
  FieldValue thisMomentTime = FieldValue.serverTimestamp();

  // add additional info to the firestore
  addMoreInformationsToDatabase(credential, email, password, username,
      profileImgPath, uid, isEmailVerified) async {
    // Add by uid
    await FirebaseFirestore.instance.collection("aboutUsers").doc(uid).set({
      "email": email,

      // there is no reason to get the password, for users privacy, don't store it in the database
      // "password": password,

      "username": username,
      "profileImgPath": profileImgPath,
      "uid": credential.user!.uid,
      "verified": isEmailVerified,
      "createdAt": thisMomentTime,
    });
  }

  // Create new account
  newAccount(String email, String password, String username) async {
    // Check validations
    bool isValidEmail = emailRegExp.hasMatch(email);
    bool isValidPassword = password.length > 4;
    bool isAcceptedUsername = username.length > 4;

// first, if they are valid, then create it immediately
    if (isValidEmail && isValidPassword && isAcceptedUsername) {
      try {
        // Show loading
        dialogsAndLoadingController.showLoading();

        // Create account method, store the credential
        final UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Here we created acc with firebase auth, the email and password only,  to collect and use more data, we need to store it
        addMoreInformationsToDatabase(
          credential,
          email,

          // There is no reason to get the password, for users privacy, don't store it in the database ( check the method)
          password,

          username,

          // This is place of profileImgPath (set to "" so we can use the default one)
          "",
          credential.user!.uid,
          FirebaseAuth.instance.currentUser?.emailVerified,
        );

        // On sign up, we should verify our user email (no need to unnecessary checks)
        Get.to(() => EmailVerificatioPage());
      } on FirebaseAuthException catch (e) {
        // else, first pop
        Get.back();

        // Error checks
        if (e.code == 'network-request-failed') {
          dialogsAndLoadingController.showError(
            capitalize(
              AppTexts.checkConnection,
            ),
          );
        }
        if (e.code == 'weak-password') {
          dialogsAndLoadingController.showError(
            capitalize(
              AppTexts.weakPassword,
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          dialogsAndLoadingController.showError(
            capitalize(
              AppTexts.emailAlreadyInUse,
            ),
          );
        }
      }

      //
      catch (e) {
        dialogsAndLoadingController.showError(
          capitalize(
            e as String,
          ),
        );
      }
    }

    // Now, if something is'nt valid, inform user about it
    if (username == "" || email.isEmpty || password == "") {
      dialogsAndLoadingController.showError(
        capitalize(
          AppTexts.fillFields,
        ),
      );
    } else if (!isAcceptedUsername) {
      dialogsAndLoadingController.showError(
        capitalize(
          AppTexts.usernameMustBe5AtLeast,
        ),
      );
    } else if (!isValidEmail) {
      dialogsAndLoadingController.showError(
        capitalize(
          AppTexts.invalidEmail,
        ),
      );
    } else if (!isValidPassword) {
      dialogsAndLoadingController.showError(
        capitalize(
          AppTexts.passwordMustBe5AtLeast,
        ),
      );
    }
  }

  @override
  void onClose() {
    // Dispose the TextEditingControllers
    signUpPasswordController.dispose();
    signUpEmailController.dispose();
    signUpUserController.dispose();
    super.onClose();
  }
}
