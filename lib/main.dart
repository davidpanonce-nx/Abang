import 'package:abang/components/loading.dart';
import 'package:abang/controllers/bottom_nav_controller.dart';
import 'package:abang/controllers/create_house_code_controller.dart';
import 'package:abang/controllers/edit_profile_controller.dart';
import 'package:abang/controllers/join_house_code_controller.dart';
import 'package:abang/controllers/streams.dart';
import 'package:abang/view/authentication/sign_up_selection.dart';
import 'package:abang/view/dashboard/landlord/landlord.dart';
import 'package:abang/view/dashboard/tenant/tenant.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const AbangApp());
}

class AbangApp extends StatefulWidget {
  const AbangApp({Key? key}) : super(key: key);

  @override
  State<AbangApp> createState() => _AbangAppState();
}

class _AbangAppState extends State<AbangApp> {
  bool firstInstall = false;

  @override
  void initState() {
    checkFirstInstall();
    super.initState();
  }

  void checkFirstInstall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      firstInstall = prefs.getBool('first') ?? true;
    });
    if (firstInstall) {
      prefs.setBool('first', false);
    }
  }

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
        ChangeNotifierProvider(
          create: (_) => CreateHouseCodeConroller(),
        ),
        ChangeNotifierProvider(
          create: (_) => JoinHouseCodeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageControllers(),
        ),
        ChangeNotifierProvider(
          create: (_) => DataStreams(""),
        ),
        ChangeNotifierProvider(
          create: (_) => EditProfileController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Abang',
        home: firstInstall ? const Splash() : const AbangAuthWrapper(),
      ),
    );
  }
}

class AbangAuthWrapper extends StatelessWidget {
  const AbangAuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userStream = Provider.of<DataStreams>(context);
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StreamBuilder<String>(
              stream: _userStream.userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == "TBD") {
                    return const JoinCreateHouseCode();
                  } else if (snapshot.data == "LANDLORD") {
                    return const LandLord();
                  } else {
                    return const Tenant();
                  }
                } else {
                  return const AbangLoading(text: "There was an Error");
                }
              });
        } else {
          return const SignUpSelection();
        }
      },
    );
  }
}
