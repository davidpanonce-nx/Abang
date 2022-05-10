import 'package:abang/components/themes.dart';
import 'package:abang/controllers/on_boarding_controller.dart';
import 'package:abang/view/splash.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/constants.dart';

class WalkthroughWrapper extends StatelessWidget {
  const WalkthroughWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    final onBoardingPageController =
        Provider.of<OnBoardingPageController>(context);
    return Scaffold(
      backgroundColor: abangColors.abangPrimary,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            onBoardingPageController.currentPageIndex == 0
                ? onBoardingPageController.onBoardingScreens[0]
                : onBoardingPageController.currentPageIndex == 1
                    ? onBoardingPageController.onBoardingScreens[1]
                    : onBoardingPageController.currentPageIndex == 2
                        ? onBoardingPageController.onBoardingScreens[2]
                        : onBoardingPageController.onBoardingScreens[3],
            Positioned(
              top: 50 / mockUpHeight * size.height,
              left: 12 / mockUpWidth * size.width,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: abangColors.abangYellow,
                iconSize: 24 / mockUpWidth * size.width,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Positioned(
              bottom: 91 / mockUpHeight * size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DotsIndicator(
                    dotsCount:
                        onBoardingPageController.onBoardingScreens.length,
                    position:
                        onBoardingPageController.currentPageIndex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: abangColors.abangSecondary,
                      color: abangColors.abangWhite,
                      spacing:
                          EdgeInsets.only(left: 8.0 / mockUpWidth * size.width),
                      size: Size.square(8.0 / mockUpWidth * size.width),
                      activeSize: Size(29.0 / mockUpWidth * size.width,
                          8.0 / mockUpHeight * size.height),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0 / mockUpWidth * size.width),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25 / mockUpHeight * size.height,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (onBoardingPageController.currentPageIndex == 3) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Splash()));
                      } else {
                        onBoardingPageController.setCurrentPageIndex();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: abangColors.abangSecondary,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                      ),
                    ),
                    child: Container(
                      width: 195 / mockUpWidth * size.width,
                      padding: EdgeInsets.symmetric(
                        vertical: 13 / mockUpHeight * size.height,
                      ),
                      child: Center(
                        child: Text(
                          onBoardingPageController.currentPageIndex != 3
                              ? "NEXT"
                              : "FINISH",
                          textScaleFactor: textScale,
                          style: abangTextStyles.buttonTextStyle.copyWith(
                            color: abangColors.abangPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
