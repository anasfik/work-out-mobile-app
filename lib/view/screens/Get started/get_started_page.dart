import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/config/Colors.dart';
import 'package:work_out/config/text.dart';
import 'package:work_out/view/components/general%20componenets/screen_background_image.dart';
import 'package:work_out/view/screens/auth/SignUpPage.dart';
import '../../../config/getStarted/getStartedData.dart';
import '../../../config/show_delay_mixin.dart';
import '../../../controller/get_started_controller/get_started_controller.dart';
import '../../../helpers/string_methods.dart';
import '../../components/general componenets/mainScreenTitle.dart';
import '../../components/general componenets/titleWithDescription.dart';
import 'componenets/get_started_cards_scroll_view.dart';

class GetStartedPage extends GetView<GetStartedController>
    with DelayHelperMixin {
  GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(),
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
                    delay: getDelayDuration(),
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
                      delay: getDelayDuration(),
                      child: TitleWithDescription(
                        title: 
                            capitalize(AppTexts.aboutYou),
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
                    child: GetStartedCardsScrollView(
                      delay: getDelayDuration(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: DelayedDisplay(
                      delay: getDelayDuration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Text(
                              capitalize(AppTexts.skipIntro),
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
                                    "${controller.checkedCardsLength} / ${handledCardsList.length}",
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
                                  child: Text(capitalize(AppTexts.next),
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
