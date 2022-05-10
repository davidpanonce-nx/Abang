import 'package:abang/components/themes.dart';
import 'package:abang/view/authentication/sign_up/sign_up_1.dart';
import 'package:abang/view/authentication/sign_up/sign_up_2.dart';
import 'package:abang/view/authentication/sign_up/sign_up_3.dart';
import 'package:abang/view/authentication/sign_up/sign_up_4.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';
import '../../../controllers/sign_up_page_controller.dart';

class SignUpWrapper extends StatefulWidget {
  const SignUpWrapper({Key? key}) : super(key: key);

  @override
  State<SignUpWrapper> createState() => _SignUpWrapperState();
}

class _SignUpWrapperState extends State<SignUpWrapper> {
  late TextEditingController _firstNameController;
  late TextEditingController _middleNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _contactNumberController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _middleNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _contactNumberController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final signUpPageController = Provider.of<SignUpPageController>(context);
    return Scaffold(
      backgroundColor: abangColors.abangPrimary,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150 / mockUpHeight * size.height,
                    ),
                    Image.asset(
                      "assets/abang_logo.png",
                      width: 276 / mockUpWidth * size.width,
                      height: 115 / mockUpHeight * size.height,
                    ),
                    SizedBox(
                      height: 15 / mockUpHeight * size.height,
                    ),
                    signUpPageController.currentPage == 1
                        ? SignUpPage1(
                            firstNameController: _firstNameController,
                            middleNameController: _middleNameController,
                            lastNameController: _lastNameController)
                        : signUpPageController.currentPage == 2
                            ? SignUpPage2(
                                contactNumberController:
                                    _contactNumberController,
                              )
                            : signUpPageController.currentPage == 3
                                ? SignUpPage3(
                                    emailController: _emailController,
                                    passwordController: _passwordController,
                                    confirmPasswordController:
                                        _confirmPasswordController,
                                  )
                                : const SignUpPage4(),
                  ],
                ),
              ),
              Positioned(
                top: 50 / mockUpHeight * size.height,
                left: 12 / mockUpWidth * size.width,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    signUpPageController.setValuesToDefault();
                  },
                  color: abangColors.abangYellow,
                  iconSize: 30 / mockUpWidth * size.width,
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              Positioned(
                bottom: 50 / mockUpHeight * size.height,
                right: 12 / mockUpWidth * size.width,
                child: signUpPageController.currentPage == 1
                    ? GestureDetector(
                        onTap: () {
                          signUpPageController.setCurrentPage("Next");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Next",
                              textScaleFactor: textScale,
                              style: abangTextStyles.nextTextStyle.copyWith(
                                color: abangColors.abangYellow,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 24 / mockUpWidth * size.width,
                              color: abangColors.abangYellow,
                            ),
                          ],
                        ),
                      )
                    : signUpPageController.currentPage == 4
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  signUpPageController.setCurrentPage("Prev");
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      size: 24 / mockUpWidth * size.width,
                                      color: abangColors.abangYellow,
                                    ),
                                    Text(
                                      "Prev",
                                      textScaleFactor: textScale,
                                      style: abangTextStyles.nextTextStyle
                                          .copyWith(
                                        color: abangColors.abangYellow,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 182 / mockUpWidth * size.width),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign Up",
                                      textScaleFactor: textScale,
                                      style: abangTextStyles.nextTextStyle
                                          .copyWith(
                                        color: abangColors.abangYellow,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 24 / mockUpWidth * size.width,
                                      color: abangColors.abangYellow,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  signUpPageController.setCurrentPage("Prev");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      size: 24 / mockUpWidth * size.width,
                                      color: abangColors.abangYellow,
                                    ),
                                    Text(
                                      "Prev",
                                      textScaleFactor: textScale,
                                      style: abangTextStyles.nextTextStyle
                                          .copyWith(
                                        color: abangColors.abangYellow,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 207 / mockUpWidth * size.width),
                              GestureDetector(
                                onTap: () {
                                  signUpPageController.setCurrentPage("Next");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Next",
                                      textScaleFactor: textScale,
                                      style: abangTextStyles.nextTextStyle
                                          .copyWith(
                                        color: abangColors.abangYellow,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 24 / mockUpWidth * size.width,
                                      color: abangColors.abangYellow,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
