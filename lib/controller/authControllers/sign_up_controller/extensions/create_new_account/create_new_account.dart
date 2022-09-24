import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/authControllers/sign_up_controller/extensions/create_new_account/add_user_info_to_firestore.dart';
import 'package:work_out/controller/authControllers/sign_up_controller/extensions/create_new_account/sign_up_catched_error.dart';
import 'package:work_out/helpers/extension/user_info_validator_extension.dart';

import '../../../../../config/text.dart';
import '../../../../../helpers/string_methods.dart';
import '../../../../../view/screens/auth/EmailVerification.dart';
import '../../sign_up_controller.dart';

extension CreateNewAccExtension on SignUpController {
  /// create new account in firebase auth, then add the  extra information such as credential, uid, time of creation, email verification status..
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
          // password: password,
        );

        // On sign up, we should verify our user email (no need to unnecessary checks)
        Get.to(() => EmailVerificatioPage());
      } on FirebaseAuthException catch (e) {
        Get.back();
        handleErrorCases(e);
      } catch (e) {
        dialogsAndLoadingController.showError(
          capitalize(
            e as String,
          ),
        );
      }
    }

    // Now, if something isn't valid, inform user about it
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
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
