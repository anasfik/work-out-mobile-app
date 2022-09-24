import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_out/controller/authControllers/sign_up_controller/sign_up_controller.dart';

extension AddExtraInfoExt on SignUpController {
  /// This will add more info to the database about the use, note that you should not add the password, for the user privacy but you can add it if you want
  Future<void> addUserInformationToFirestore({
    required UserCredential credential,
    required String email,
    required String username,
    required String profileImgPath,
    required String uid,
    required bool isEmailVerified,
    String? password,
  }) async {
    // Add by uid
    await FirebaseFirestore.instance.collection("aboutUsers").doc(uid).set({
      "email": email,

      // there is no reason to get the password, for users privacy, don't store it in the database
      "password": password ?? "",
      "username": username,
      "profileImgPath": profileImgPath,
      "uid": credential.user!.uid,
      "verified": isEmailVerified,
      "createdAt": thisMomentTime,
    });
  }
}
