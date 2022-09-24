import 'package:work_out/controller/authControllers/login_controller/login_controller.dart';

import '../../../../config/text.dart';
import '../../../../helpers/string_methods.dart';

extension ErrorHandlesExtension on LoginController {
  void handleErrorCases(e) {
    // Errors checks (if you want to be more specific make for each error a case) on this pattern
    if (e.code == 'network-request-failed') {
      dialogsAndLoadingController
          .showError(capitalize(AppTexts.checkConnection));
    }
    if (e.code == 'user-not-found') {
      dialogsAndLoadingController.showError(AppTexts.noUserText);
    } else if (e.code == 'wrong-password') {
      dialogsAndLoadingController.showError(capitalize(AppTexts.wrongPassword));
    } else {
      dialogsAndLoadingController.showError(e.code);
    }
  }
}
