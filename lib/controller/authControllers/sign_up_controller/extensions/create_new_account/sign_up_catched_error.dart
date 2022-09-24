import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_out/controller/authControllers/sign_up_controller/sign_up_controller.dart';

import '../../../../../config/text.dart';
import '../../../../../helpers/string_methods.dart';

extension ErrorCasesHandler on SignUpController {
  void _handleErrorCases(FirebaseAuthException e) {
    if (e.code == 'network-request-failed') {
      dialogsAndLoadingController.showError(
        capitalize(
          AppTexts.checkConnection,
        ),
      );
    } else if (e.code == 'weak-password') {
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

  /// Shows error dialog for handled exception, set showErrorDialogOnUnhandledError to false to show nothing for unhandled firebase error
  void Function(FirebaseAuthException) get handleErrorCases =>
      _handleErrorCases;
}
