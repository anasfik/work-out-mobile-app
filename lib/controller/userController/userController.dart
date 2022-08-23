import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_out/controller/functionsController.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebasecore;
import '../functionsController/dialogsAndLoadingController.dart';

class UserInformationController extends GetxController {
  //variables
  late RxString username = "Anonym user".obs;
  RxString userProfileImg =
      "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile.png".obs;

  // depen. inj
  FunctionsController controller = Get.put(FunctionsController());
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());

  // get username from firestore(returns as string)
  setUsername() async {
    username.value = await FirebaseFirestore.instance
        .collection("aboutUsers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => value["username"]);
  }

  setProfileImgPath() async {
    String newGettedPath = await FirebaseFirestore.instance
        .collection("aboutUsers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => value["profileImgPath"]);

    if (newGettedPath != userProfileImg.value && newGettedPath != "") {
      print(newGettedPath);
      print(userProfileImg.value);

      userProfileImg.value = newGettedPath;
    } else {
      //  print("no new profile img");
    }
  }

  getImgFromCamera() async {
    ImagePicker _picker = ImagePicker();

    XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      return image;
    } else {
      dialogsAndLoadingController
          .showError(controller.capitalize("operation canceled"));
    }
  }

  getImgFromDevice() async {
    ImagePicker _picker = ImagePicker();

    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image;
    } else {
      dialogsAndLoadingController
          .showError(controller.capitalize("operation canceled"));
    }
  }

  updateProfile(XFile? image) async {
    if (image != null) {
      final storage = FirebaseStorage.instance;
      final userProfileImg = storage
          .ref("usersProfileImgs/${FirebaseAuth.instance.currentUser!.uid}");
      File file = File(image.path);

      try {
        dialogsAndLoadingController.showLoading();
        await userProfileImg.putFile(file);
        Get.back();
        dialogsAndLoadingController.showSuccess(
            controller.capitalize("profile image updated successfully"));
        String imgPath = await userProfileImg.getDownloadURL();
        await FirebaseFirestore.instance
            .collection("aboutUsers")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "profileImgPath": imgPath,
        });
      } on firebasecore.FirebaseException catch (e) {
        Get.back();
        dialogsAndLoadingController.showError("$e");
      }
    } else {
      print("canceled");
    }
  }

// update username in firestore and set new one in the view (lifecycle)
  updateUsername(String newUsername) async {
    Get.back();
    dialogsAndLoadingController.showLoading();

    try {
      await FirebaseFirestore.instance
          .collection("aboutUsers")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "username": newUsername,
      });
      Get.back();
      // username is observable (.obs) changing it's value change it also in the UI
      username.value = newUsername;

      dialogsAndLoadingController
          .showSuccess(controller.capitalize("username updates succefully"));
    } on FirebaseException catch (e) {
      dialogsAndLoadingController.showError("${e.message}");
    }
  }

// update login email with FirebaseAuth
  updateEmail(String newEmail) async {
    Get.back();
    dialogsAndLoadingController.showLoading();
    try {
      await FirebaseAuth.instance.currentUser!.updateEmail(newEmail);
// updating data in firestore
// after next opening of the app it'll demand to verify new email
      await FirebaseFirestore.instance
          .collection("aboutUsers")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "email": newEmail,
        "verified": FirebaseAuth.instance.currentUser!.emailVerified,
      });
      Get.back();
      dialogsAndLoadingController
          .showSuccess(controller.capitalize("email updates succefully"));
    } on FirebaseAuthException catch (e) {
      Get.back();
// firebase rules: if you want to update it, you should re-login to verify that your the owner
      if (e.code == 'requires-recent-login') {
        dialogsAndLoadingController.showConfirmWithActions(
            "due to safety reasons, you need a recent re-login to your account in order to get permission to change email",
            controller.capitalize("re-login"), () {
          FirebaseAuth.instance.signOut();
        });
      } else {
        dialogsAndLoadingController.showError(e.toString());
      }
    }
  }

// update password with FirebaseAuth and update it in firestore
  updatePassword(String newPassword) async {
    Get.back();
    dialogsAndLoadingController.showLoading();
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
// update in firestore
      await FirebaseFirestore.instance
          .collection("aboutUsers")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "password": newPassword,
      });
      Get.back();
      dialogsAndLoadingController
          .showSuccess(controller.capitalize("password updates succefully"));
    } on FirebaseAuthException catch (e) {
      Get.back();
// firebase rules: if you want to update it, you should re-login to verify that your the owner
      if (e.code == 'requires-recent-login') {
        dialogsAndLoadingController.showConfirmWithActions(
            "due to safety reasons, you need a recent re-login to your account in order to get permission to change password",
            controller.capitalize("re-login"), () {
          FirebaseAuth.instance.signOut();
        });
      } else if (e.code == 'weak-password') {
        dialogsAndLoadingController
            .showError(controller.capitalize("weak password"));
      } else {
        dialogsAndLoadingController.showError(e.toString());
      }
    }
  }

// delete user
  deleteUser() async {
    Get.back();
    dialogsAndLoadingController.showLoading();
    try {
      await FirebaseAuth.instance.currentUser?.delete();

      dialogsAndLoadingController
          .showSuccess(controller.capitalize("user deleted"));
    } on FirebaseException catch (e) {
      Get.back();
// firebase rules: if you want to update it, you should re-login to verify that your the owner
      if (e.code == 'requires-recent-login') {
        dialogsAndLoadingController.showConfirmWithActions(
            "due to safety reasons, you need a recent re-login to your account in order to get permission to change password",
            controller.capitalize("re-login"), () {
          FirebaseAuth.instance.signOut();
        });
      } else if (e.code == 'weak-password') {
        dialogsAndLoadingController
            .showError(controller.capitalize("weak password"));
      } else {
        dialogsAndLoadingController.showError(e.toString());
      }
    }
  }

  @override
  void onReady() {
    setUsername();
    setProfileImgPath();
    // TODO: implement onReady
    super.onReady();
  }
}
