import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/inAppData/Colors.dart';
import 'package:work_out/inAppData/images%20sources.dart';
import 'package:work_out/inAppData/text.dart';
import 'package:work_out/view/screens/auth/SignUpPage.dart';
import '../../../controller/functionsController.dart';
import '../../../inAppData/getStarted/getStartedData.dart';
import '../../../inAppData/showDelayController.dart';
import '../../components/general componenets/mainScreenTitle.dart';
import '../../components/general componenets/titleWithDescription.dart';
import 'componenets/GetStartedCard.dart';

class GetStartedPage extends StatelessWidget {
  GetStartedPage({Key? key}) : super(key: key);

  // Dependency injection
  final FunctionsController controller = Get.put(FunctionsController());

  //
  final delayHelper = DelayHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              ImgSrc().randomFromAssetsList(),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: const Color(0xff0B183C).withOpacity(0.69),
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  DelayedDisplay(
                    delay: delayHelper.getDelayDuration(),
                    child: MainScreenTitle(
                      mainWord: AppTexts.firstMainWord,
                      secondaryWord: AppTexts.secondaryMainWord,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: DelayedDisplay(
                      delay: delayHelper.getDelayDuration(),
                      child: TitleWithDescription(
                        title: controller.capitalize(AppTexts.aboutYou),
                        description: AppTexts.getStartedDescription,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            primary: Colors.transparent,
                            secondary: Colors.transparent,
                          ),
                    ),
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            ...List.generate(
                              cardsList.length,
                              (i) => DelayedDisplay(
                                delay: delayHelper.getDelayDuration(),
                                child: GetStartedCard(
                                  text: cardsList[i]["title"],
                                  description: cardsList[i]["description"],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: DelayedDisplay(
                      delay: delayHelper.getDelayDuration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Text(
                              controller.capitalize(AppTexts.skipIntro),
                              style: TextStyle(
                                color:
                                    const Color(0xffffffff).withOpacity(0.42),
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "2 / ${cardsList.length}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.green,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    primary: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    Get.to(SignUpPage());
                                  },
                                  child: Text(
                                      controller.capitalize(AppTexts.next),
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
