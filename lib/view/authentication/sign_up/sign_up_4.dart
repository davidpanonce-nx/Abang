import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';
import '../../../components/themes.dart';
import '../../../controllers/sign_up_page_controller.dart';

class SignUpPage4 extends StatefulWidget {
  const SignUpPage4({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpPage4> createState() => _SignUpPage4State();
}

class _SignUpPage4State extends State<SignUpPage4>
    with TickerProviderStateMixin {
  bool isObscurePassword = true;

  bool isObscureConfirmPassword = true;
  setObscurePassword() {
    setState(() {
      isObscurePassword = !isObscurePassword;
    });
  }

  setObscureConfirmPassword() {
    setState(() {
      isObscureConfirmPassword = !isObscureConfirmPassword;
    });
  }

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
    final signUpPageController = Provider.of<SignUpPageController>(context);
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
              child: Form(
                key: widget.formKey,
                child: Column(
                  children: [
                    Text(
                      "Account Details",
                      textAlign: TextAlign.center,
                      textScaleFactor: textScale,
                      style: abangTextStyles.titleTextStyle.copyWith(
                          color: abangColors.abangWhite, letterSpacing: 0.15),
                    ),
                    SizedBox(
                      height: 60 / mockUpHeight * size.height,
                    ),
                    TextFormField(
                      cursorColor: abangColors.abangWhite,
                      cursorHeight: 20 / mockUpHeight * size.height,
                      controller: widget.emailController,
                      style: abangTextStyles.smallTextStyle
                          .copyWith(color: abangColors.abangWhite),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!val.contains("@") && val.isNotEmpty) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.fromLTRB(
                          20 / mockUpWidth * size.width,
                          20 / mockUpHeight * size.height,
                          20 / mockUpWidth * size.width,
                          20 / mockUpHeight * size.height,
                        ),
                        hintText: "Email address",
                        hintStyle: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangWhite.withOpacity(0.50),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangYellow,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangYellow,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangSecondary,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
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
                      obscureText: isObscurePassword,
                      cursorHeight: 20 / mockUpHeight * size.height,
                      controller: widget.passwordController,
                      style: abangTextStyles.smallTextStyle
                          .copyWith(color: abangColors.abangWhite),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter a password";
                        }

                        if (val.isNotEmpty && val.length < 7) {
                          return "Password should be atleast 7 characters long";
                        }

                        if (val != widget.confirmPasswordController.text &&
                            val.isNotEmpty) {
                          return "Password doesn't match";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.fromLTRB(
                          20 / mockUpWidth * size.width,
                          20 / mockUpHeight * size.height,
                          20 / mockUpWidth * size.width,
                          20 / mockUpHeight * size.height,
                        ),
                        hintText: "Password",
                        hintStyle: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangWhite.withOpacity(0.50),
                        ),
                        suffixIcon: isObscurePassword
                            ? IconButton(
                                onPressed: () => setObscurePassword(),
                                color: abangColors.abangYellow,
                                iconSize: 24 / mockUpWidth * size.width,
                                icon: const Icon(
                                  Icons.visibility_off,
                                ),
                              )
                            : IconButton(
                                onPressed: () => setObscurePassword(),
                                color: abangColors.abangYellow,
                                iconSize: 24 / mockUpWidth * size.width,
                                icon: const Icon(
                                  Icons.visibility,
                                ),
                              ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangYellow,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangYellow,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangSecondary,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
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
                      obscureText: isObscureConfirmPassword,
                      controller: widget.confirmPasswordController,
                      style: abangTextStyles.smallTextStyle
                          .copyWith(color: abangColors.abangWhite),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please confirm your password";
                        }

                        if (val.isNotEmpty && val.length < 7) {
                          return "Password should be atleast 7 characters long";
                        }

                        if (val != widget.passwordController.text &&
                            val.isNotEmpty) {
                          return "Password doesn't match";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.fromLTRB(
                          20 / mockUpWidth * size.width,
                          20 / mockUpHeight * size.height,
                          20 / mockUpWidth * size.width,
                          20 / mockUpHeight * size.height,
                        ),
                        hintText: "Confirm Password",
                        hintStyle: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangWhite.withOpacity(0.50),
                        ),
                        suffixIcon: isObscureConfirmPassword
                            ? IconButton(
                                onPressed: () => setObscureConfirmPassword(),
                                color: abangColors.abangYellow,
                                iconSize: 24 / mockUpWidth * size.width,
                                icon: const Icon(
                                  Icons.visibility_off,
                                ),
                              )
                            : IconButton(
                                onPressed: () => setObscureConfirmPassword(),
                                color: abangColors.abangYellow,
                                iconSize: 24 / mockUpWidth * size.width,
                                icon: const Icon(
                                  Icons.visibility,
                                ),
                              ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangYellow,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangYellow,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangSecondary,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangSecondary,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: signUpPageController.errorMessage != "",
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                          Text(
                            signUpPageController.errorMessage,
                            textAlign: TextAlign.center,
                            style:
                                abangTextStyles.descriptionTextStyle.copyWith(
                              color: abangColors.abangSecondary,
                              fontSize: 12,
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
        },
      ),
    );
  }
}
