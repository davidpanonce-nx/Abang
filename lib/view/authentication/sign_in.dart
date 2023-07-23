import 'package:abang/components/loading.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/controllers/sign_up_page_controller.dart';
import 'package:abang/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/constants.dart';
import '../../controllers/routes.dart';
import '../../main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with FirebaseAuthentication {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isObscure = true;

  final _formKey = GlobalKey<FormState>();

  setObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final routes = Provider.of<Routes>(context);
    final signUpPageController = Provider.of<SignUpPageController>(context);
    return signUpPageController.isLoading
        ? const AbangLoading(text: "Signing In")
        : Scaffold(
            backgroundColor: abangColors.abangPrimary,
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      Text(
                        "Welcome Back!",
                        textScaleFactor: textScale,
                        textAlign: TextAlign.center,
                        style: abangTextStyles.titleTextStyle.copyWith(
                          color: abangColors.abangWhite,
                          letterSpacing: 0.15,
                        ),
                      ),
                      SizedBox(
                        height: 80 / mockUpHeight * size.height,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12 / mockUpWidth * size.width),
                        child: TextFormField(
                          cursorColor: abangColors.abangWhite,
                          cursorHeight: 20 / mockUpHeight * size.height,
                          controller: _emailController,
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
                      ),
                      SizedBox(
                        height: 8 / mockUpHeight * size.height,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12 / mockUpWidth * size.width),
                        child: TextFormField(
                          cursorColor: abangColors.abangWhite,
                          obscureText: isObscure,
                          cursorHeight: 20 / mockUpHeight * size.height,
                          controller: _passwordController,
                          style: abangTextStyles.smallTextStyle
                              .copyWith(color: abangColors.abangWhite),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter a password";
                            }

                            if (val.isNotEmpty && val.length < 7) {
                              return "Password should be atleast 7 characters long";
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
                            suffixIcon: isObscure
                                ? IconButton(
                                    onPressed: () => setObscure(),
                                    color: abangColors.abangYellow,
                                    iconSize: 24 / mockUpWidth * size.width,
                                    icon: const Icon(
                                      Icons.visibility_off,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () => setObscure(),
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
                      ),
                      signUpPageController.errorMessage != ""
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20 / mockUpHeight * size.height,
                                ),
                                Text(
                                  signUpPageController.errorMessage,
                                  textAlign: TextAlign.center,
                                  style: abangTextStyles.descriptionTextStyle
                                      .copyWith(
                                    color: abangColors.abangSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 49 / mockUpHeight * size.height,
                            ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12 / mockUpWidth * size.width,
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              signUpPageController.setIsLoading(true);
                              final response = await signIn(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              );

                              if (response["response"] == 400) {
                                signUpPageController
                                    .setErrorMessage(response["data"]);
                                signUpPageController.setIsLoading(false);
                              } else {
                                signUpPageController.setErrorMessage("");
                                if (mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AbangAuthWrapper(),
                                    ),
                                  );
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: abangColors.abangYellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                            ),
                          ),
                          child: Container(
                            width: 355 / mockUpWidth * size.width,
                            padding: EdgeInsets.symmetric(
                              vertical: 20 / mockUpHeight * size.height,
                            ),
                            child: Center(
                              child: Text(
                                "SIGN IN",
                                textScaleFactor: textScale,
                                style: abangTextStyles.buttonTextStyle.copyWith(
                                  color: abangColors.abangPrimary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 355 / mockUpWidth * size.width,
                        padding: EdgeInsets.symmetric(
                          vertical: 11 / mockUpHeight * size.height,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: abangTextStyles.smallTextStyle.copyWith(
                                  color: abangColors.abangWhite,
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await signUpPageController
                                      .readJson()
                                      .whenComplete(() {
                                    Navigator.of(context)
                                        .push(routes.toSignUp());
                                  });
                                },
                                child: Text(
                                  "Register now",
                                  style:
                                      abangTextStyles.smallTextStyle.copyWith(
                                    color: abangColors.abangYellow,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
