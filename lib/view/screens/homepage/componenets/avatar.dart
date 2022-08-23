import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/userController/userController.dart';

class Avatar extends StatelessWidget {
   Avatar({
    Key? key,
    required this.onProfileImgTap,
  }) : super(key: key);

  final UserInformationController userInformationController =
      Get.put(UserInformationController());
  final void Function()? onProfileImgTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProfileImgTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
        ),
        width: 50,
        height: 50,
        child: Obx(
          (() => Image(
                image: NetworkImage(
                    userInformationController.userProfileImg.value),
                // fit: BoxFit.cover,
                errorBuilder: (context, error, stackTracec) {
                  return Text("e");
                },
                frameBuilder: (_, image, loadingBuilder, __) {
                  if (loadingBuilder == null) {
                    return SizedBox(
                      height: 300,
                      child: Center(
                        child: SpinKitSpinningLines(
                          color: Theme.of(context).primaryColor,
                          duration: const Duration(seconds: 1),
                          size: 40,
                        ),
                      ),
                    );
                  }
                  return image;
                },
              )),
        ),
      ),
    );
  }
}
