import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/authControllers/sign_up_controller/extensions/create_new_account/add_user_info_to_firestore.dart';
import 'package:work_out/helpers/extension/user_info_validator_extension.dart';

import '../../../../../config/text.dart';
import '../../../../../helpers/string_methods.dart';
import '../../../../../view/screens/auth/EmailVerification.dart';
import '../../sign_up_controller.dart';



extension CreateNewAccExt on SignUpController {
  Future<void> createNewAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    if (email.isValidEmail &&
        password.isValidPassword &&
        username.isAcceptedUsername) {
      try {
        dialogsAndLoadingController.showLoading();

        // Firebase create account method, store the credential
        final UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Here we created acc with firebase auth, the email and password only,  to collect and use more data, we need to store it
        addUserInformationToFirestore(
          credential: credential,
          email: email,
          username: username,
          isEmailVerified: FirebaseAuth.instance.currentUser!.emailVerified,
          uid: credential.user!.uid,
          profileImgPath: "",
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
    } else if (!username.isAcceptedUsername) {
      dialogsAndLoadingController.showError(
        capitalize(
          AppTexts.usernameMustBe5AtLeast,
        ),
      );
    } else if (!email.isValidEmail) {
      dialogsAndLoadingController.showError(
        capitalize(
          AppTexts.invalidEmail,
        ),
      );
    } else if (!password.isValidPassword) {
      dialogsAndLoadingController.showError(
        capitalize(
          AppTexts.passwordMustBe5AtLeast,
        ),
      );
    }
  }
}
