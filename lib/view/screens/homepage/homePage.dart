
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/inAppData/Colors.dart';
import 'package:work_out/inAppData/text.dart';
import 'package:work_out/inAppData/workouts%20lists/workouts%20Lists.dart';
import 'package:work_out/view/screens/user%20profile/userProfil.dart';

import '../../../controller/functionsController.dart';
import '../../../controller/tabs controllers/workOutTabController.dart';
import '../../../controller/userController/userController.dart';
import '../../../inAppData/images sources.dart';
import 'componenets/HomePageSearchBar.dart';
import 'componenets/ItemsSwitchTiles.dart';
import 'componenets/playButton.dart';
import 'componenets/tabBarViewSections.dart';
import 'componenets/usernameAndProfile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FunctionsController controller = Get.put(FunctionsController());
  final UserInformationController userInformationController =
      Get.put(UserInformationController(), permanent: true);
  final CustomTabBarController _tabx = Get.put(CustomTabBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            ImgSrc.homepageOverlay,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0.45, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColors.darkBlue,
                AppColors.darkBlue.withOpacity(0.05),
              ],
            ),
          ),
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 50,
                ),
                DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay),
                    child: Obx(
                      () => ProfileAndUsername(
                          onProfileImgTap: () {
                            Get.to(() => const UserProfile());
                          },
                          username: controller.capitalize(
                              userInformationController.username.value),
                          profileImg: userInformationController.userProfileImg.value),
                    )),
                const SizedBox(
                  height: 55,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: controller.delay + 100),
                  child: const PlayButton(),
                ),
                const SizedBox(
                  height: 55,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: controller.delay + 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: controller.capitalize(AppTexts.find),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 25,
                          ),
                          children: [
                            const TextSpan(text: " "),
                            TextSpan(
                              text: controller.capitalize(AppTexts.yourWorkout),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (() {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: Text(AppTexts.filterBy),
                                  content: const ItemsCheckboxTiles(),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(
                                          Colors.grey[200],
                                        ),
                                      ),
                                      child: Text(
                                        AppTexts.cancel,
                                        style: const TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(
                                          Colors.grey[200],
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        AppTexts.apply,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                        child: const Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 45,
                  child: DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 300),
                    child: const HomePageSearchBar(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  child: DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 400),
                    child: TabBar(
                      labelColor: Colors.white,
                      isScrollable: true,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      controller: _tabx.workOutTabController,
                      tabs: _tabx.workOutTabs,
                    ),
                  ),
                ),
                Expanded(
                  child: DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 600),
                    child: TabBarView(
                      controller: _tabx.workOutTabController,
                      children: [
                        Center(
                          child: TabBarViewSection(
                            title: controller.capitalize(
                              'All workouts',
                            ),
                            dataList: WorkoutsList.allWorkoutsList,
                          ),
                        ),
                        Center(
                          child: TabBarViewSection(
                            title: controller.capitalize(
                              'Popular',
                            ),
                            dataList: WorkoutsList.popularWorkoutsList,
                          ),
                        ),
                        Center(
                          child: TabBarViewSection(
                              title: controller.capitalize(
                                'hard',
                              ),
                              dataList: WorkoutsList.hardWorkoutsList),
                        ),
                        Center(
                          child: TabBarViewSection(
                              title: controller.capitalize(
                                'Full body',
                              ),
                              dataList: WorkoutsList.fullBodyWorkoutsList),
                        ),
                        Center(
                          child: TabBarViewSection(
                              title: controller.capitalize(
                                'Crossfit',
                              ),
                              dataList: WorkoutsList.crossFit),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
