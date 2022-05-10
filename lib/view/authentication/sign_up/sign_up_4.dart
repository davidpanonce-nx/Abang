import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../components/themes.dart';

class SignUpPage4 extends StatefulWidget {
  const SignUpPage4({Key? key}) : super(key: key);

  @override
  State<SignUpPage4> createState() => _SignUpPage4State();
}

class _SignUpPage4State extends State<SignUpPage4>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _fadeController;
  late final Animation<double> _fadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ),
  );

  late final Animation<double> _scale = Tween<double>(
    begin: 0.95,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0,
        1,
        curve: Curves.easeOut,
      ),
    ),
  );
  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: AnimatedBuilder(
        animation: _animationController..forward(),
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _scale.value,
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  Text(
                    "Signature",
                    textAlign: TextAlign.center,
                    textScaleFactor: textScale,
                    style: abangTextStyles.titleTextStyle.copyWith(
                        color: abangColors.abangWhite, letterSpacing: 0.15),
                  ),
                  SizedBox(
                    height: 54 / mockUpHeight * size.height,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 330 / mockUpWidth * size.width,
                      height: 200 / mockUpHeight * size.height,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: abangColors.abangYellow,
                          width: 2 / mockUpWidth * size.width,
                        ),
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                      ),
                      child: Center(
                        child: Text(
                          "Tap here to sign",
                          style: abangTextStyles.smallTextStyle.copyWith(
                            color: abangColors.abangWhite.withOpacity(0.50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
