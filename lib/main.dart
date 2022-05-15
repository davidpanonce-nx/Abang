import 'package:abang/components/loading.dart';
import 'package:abang/controllers/create_house_code_controller.dart';
import 'package:abang/view/authentication/sign_up_selection.dart';
import 'package:abang/view/join/create/join_create.dart';
import 'package:abang/view/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/on_boarding_controller.dart';
import 'controllers/routes.dart';
import 'controllers/sign_up_page_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AbangApp());
}

class AbangApp extends StatefulWidget {
  const AbangApp({Key? key}) : super(key: key);

  @override
  State<AbangApp> createState() => _AbangAppState();
}

class _AbangAppState extends State<AbangApp> {
  late bool firstInstall;

  @override
  void initState() {
    checkFirstInstall();
    super.initState();
  }

  void checkFirstInstall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    firstInstall = prefs.getBool('firstInstall') ?? true;

    if (firstInstall) {
      prefs.setBool('firstInstall', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
      future: _init,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
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
              ChangeNotifierProvider(
                create: (_) => CreateHouseCodeConroller(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Abang',
              home: firstInstall ? const Splash() : const AbangAuthWrapper(),
            ),
          );
        } else {
          return const MaterialApp(
            title: 'Abang',
            debugShowCheckedModeBanner: false,
            home: AbangLoading(),
          );
        }
      },
    );
  }
}

class AbangAuthWrapper extends StatelessWidget {
  const AbangAuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AbangLoading(text: "Loading");
          } else if (snapshot.hasError) {
            return const AbangLoading(text: "There was an Error");
          } else if (snapshot.hasData) {
            return const JoinCreateHouseCode();
          } else {
            return const SignUpSelection();
          }
        });
  }
}
