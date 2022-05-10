import 'dart:async';

import 'package:abang/components/constants.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/view/walkthrough%20screens/walkthrough_wrapper.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const WalkthroughWrapper(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: abangColors.abangPrimary,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              width: 375 / mockUpWidth * size.width,
              height: 182 / mockUpHeight * size.height,
              child: Image.asset(
                "assets/splash_right_corner.png",
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: 375 / mockUpWidth * size.width,
              height: 196 / mockUpHeight * size.height,
              child: Image.asset(
                "assets/splash_left_corner.png",
              ),
            ),
            Positioned(
              top: 330 / mockUpHeight * size.height,
              right: 49.5 / mockUpWidth * size.width,
              height: 115 / mockUpHeight * size.height,
              width: 276 / mockUpWidth * size.width,
              child: Image.asset('assets/abang_logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
