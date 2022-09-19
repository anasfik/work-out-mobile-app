import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/controller/functionsController.dart';
import '../../../controller/userProfileOptions/userProfileOptionsController.dart';
import '../../../helpers/string_methods.dart';
import 'components/appBar.dart';

class CustomProfileSettings extends StatelessWidget {
  CustomProfileSettings({Key? key})
      : super(
          key: key,
        );
  final FunctionsController controller = Get.find();
  final UserProfileOptionsController userProfileOptionsController =
      Get.put(UserProfileOptionsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ProfileAppBar(),
      ),
      backgroundColor: Get.arguments[0],
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              userProfileOptionsController.userProfileOptionsList.length,
              (i) => DelayedDisplay(
                delay: Duration(milliseconds: delay + 100 * i),
                child: Container(
                  decoration: BoxDecoration(
                      color: Get.arguments[1],
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: InkWell(
                    onTap: userProfileOptionsController
                        .userProfileOptionsList[i]["optionFunction"],
                    child: ListTile(
                      title: Text(
                        capitalize(userProfileOptionsController
                            .userProfileOptionsList[i]["optionTitle"]),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: i ==
                                    userProfileOptionsController
                                            .userProfileOptionsList.length -
                                        1
                                ? Colors.red
                                : Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                      leading: Icon(
                        userProfileOptionsController.userProfileOptionsList[i]
                            ["optionIcon"],
                        color: i ==
                                userProfileOptionsController
                                        .userProfileOptionsList.length -
                                    1
                            ? Colors.red
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
