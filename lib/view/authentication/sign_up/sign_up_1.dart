import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class SignUpPage1 extends StatefulWidget {
  const SignUpPage1({
    Key? key,
    required this.firstNameController,
    required this.middleNameController,
    required this.lastNameController,
  }) : super(key: key);

  final TextEditingController firstNameController;
  final TextEditingController middleNameController;
  final TextEditingController lastNameController;
  @override
  State<SignUpPage1> createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1>
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
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: 12 / mockUpWidth * size.width),
              child: Column(
                children: [
                  Text(
                    "What's your name?",
                    textAlign: TextAlign.center,
                    textScaleFactor: textScale,
                    style: abangTextStyles.titleTextStyle.copyWith(
                        color: abangColors.abangWhite, letterSpacing: 0.15),
                  ),
                  SizedBox(
                    height: 91 / mockUpHeight * size.height,
                  ),
                  TextFormField(
                    cursorColor: abangColors.abangWhite,
                    cursorHeight: 20 / mockUpHeight * size.height,
                    controller: widget.firstNameController,
                    style: abangTextStyles.smallTextStyle
                        .copyWith(color: abangColors.abangWhite),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.fromLTRB(
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                      ),
                      hintText: "First name",
                      hintStyle: abangTextStyles.smallTextStyle.copyWith(
                        color: abangColors.abangWhite.withOpacity(0.50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangSecondary,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangSecondary,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8 / mockUpHeight * size.height,
                  ),
                  TextFormField(
                    cursorColor: abangColors.abangWhite,
                    cursorHeight: 20 / mockUpHeight * size.height,
                    controller: widget.middleNameController,
                    style: abangTextStyles.smallTextStyle
                        .copyWith(color: abangColors.abangWhite),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.fromLTRB(
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                      ),
                      hintText: "Middle name (optional)",
                      hintStyle: abangTextStyles.smallTextStyle.copyWith(
                        color: abangColors.abangWhite.withOpacity(0.50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangSecondary,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangSecondary,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8 / mockUpHeight * size.height,
                  ),
                  TextFormField(
                    cursorColor: abangColors.abangWhite,
                    cursorHeight: 20 / mockUpHeight * size.height,
                    controller: widget.lastNameController,
                    style: abangTextStyles.smallTextStyle
                        .copyWith(color: abangColors.abangWhite),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.fromLTRB(
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                      ),
                      hintText: "Last name",
                      hintStyle: abangTextStyles.smallTextStyle.copyWith(
                        color: abangColors.abangWhite.withOpacity(0.50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangSecondary,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangSecondary,
                          width: 2.0 / mockUpWidth * size.width,
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
