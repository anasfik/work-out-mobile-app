import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/inAppData/images%20sources.dart';
import 'package:work_out/inAppData/text.dart';
import 'package:work_out/view/screens/auth/SignUpPage.dart';
import '../../../controller/functionsController.dart';
import '../../../inAppData/getStarted/getStartedData.dart';
import '../../components/general componenets/mainScreenTitle.dart';
import '../../components/general componenets/titleWithDescription.dart';
import 'componenets/GetStartedCard.dart';

class GetStartedPage extends StatelessWidget {
  GetStartedPage({Key? key}) : super(key: key);
  // depen. injection
  final FunctionsController controller = Get.put(FunctionsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              ImgSrc.getStarted,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: const Color(0xff0B183C).withOpacity(0.69),
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 15, bottom: 15, right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: controller.delay + 100),
                      child: MainScreenTitle(
                          mainWord: AppTexts.firstMainWord,
                          secondaryWord: AppTexts.secondaryMainWord),
                    ),
                  ),
                  const SizedBox(height: 100),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 200),
                    child: TitleWithDescription(
                      title: controller.capitalize(AppTexts.aboutYou),
                      description: AppTexts.getStartedDescription,
                    ),
                  ),
                  const SizedBox(height: 100),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        ...List.generate(
                          
                              cardsList.length,
                          (i) => DelayedDisplay(
                            delay: Duration(
                                milliseconds:
                                    controller.delay + 300 + 100 * (i + 1)),
                            child: GetStartedCard(
                              text: cardsList[i]["title"],
                              description: cardsList[i]["description"],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: controller.delay + 300),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            child: Text(controller.capitalize(AppTexts.next),
                                style: const TextStyle(color: Colors.white)),
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
