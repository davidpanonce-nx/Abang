import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/constants.dart';
import '../../controllers/routes.dart';
import '../../controllers/sign_up_page_controller.dart';

class SignUpSelection extends StatelessWidget {
  const SignUpSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final routes = Provider.of<Routes>(context);
    final signUpPageController = Provider.of<SignUpPageController>(context);
    return Scaffold(
      backgroundColor: abangColors.abangPrimary,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
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
                "Abang lang: Kami Bahala",
                textScaleFactor: textScale,
                textAlign: TextAlign.center,
                style: abangTextStyles.titleTextStyle.copyWith(
                  color: abangColors.abangWhite,
                  fontSize: 24,
                  letterSpacing: 0.15,
                ),
              ),
              SizedBox(
                height: 258 / mockUpHeight * size.height,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12 / mockUpWidth * size.width,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    await signUpPageController.readJson().whenComplete(() {
                      signUpPageController.setIsLoading(false);
                      Navigator.of(context).push(routes.toSignUp());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: abangColors.abangYellow,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5 / mockUpWidth * size.width),
                    ),
                  ),
                  child: Container(
                    width: 355 / mockUpWidth * size.width,
                    padding: EdgeInsets.symmetric(
                      vertical: 20 / mockUpHeight * size.height,
                    ),
                    child: Center(
                      child: Text(
                        "SIGN UP",
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12 / mockUpWidth * size.width,
                ),
                child: Container(
                  width: 355 / mockUpWidth * size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 11 / mockUpHeight * size.height,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: abangTextStyles.smallTextStyle.copyWith(
                            color: abangColors.abangWhite,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            signUpPageController.setIsLoading(false);
                            Navigator.of(context)
                                .pushReplacement(routes.toSignIn());
                          },
                          child: Text(
                            "Sign In",
                            style: abangTextStyles.smallTextStyle.copyWith(
                              color: abangColors.abangYellow,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
