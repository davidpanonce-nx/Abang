import 'package:abang/controllers/on_boarding_controller.dart';
import 'package:abang/controllers/routes.dart';
import 'package:abang/controllers/sign_up_page_controller.dart';
import 'package:abang/view/authentication/sign_up_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AbangApp());
}

class AbangApp extends StatefulWidget {
  const AbangApp({Key? key}) : super(key: key);

  @override
  State<AbangApp> createState() => _AbangAppState();
}

class _AbangAppState extends State<AbangApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnBoardingPageController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpPageController(),
        ),
        ChangeNotifierProvider(
          create: (_) => Routes(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Abang',
        home: SignUpSelection(),
      ),
    );
  }
}
