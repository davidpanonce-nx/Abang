import 'package:abang/components/themes.dart';
import 'package:abang/view/authentication/sign_in.dart';
import 'package:abang/view/authentication/sign_up/sign_up_wrapper.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class Routes extends ChangeNotifier {
  Route toSignIn() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SignIn(),
      barrierColor: abangColors.abangPrimary,
      transitionDuration: const Duration(milliseconds: 900),
      reverseTransitionDuration: const Duration(milliseconds: 900),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        secondaryAnimation = CurvedAnimation(
            parent: secondaryAnimation, curve: Curves.easeInOut);
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }

  Route toSignUp() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignUpWrapper(),
      barrierColor: abangColors.abangPrimary,
      transitionDuration: const Duration(milliseconds: 900),
      reverseTransitionDuration: const Duration(milliseconds: 900),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        secondaryAnimation = CurvedAnimation(
            parent: secondaryAnimation, curve: Curves.easeInOut);
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }
}
