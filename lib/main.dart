import 'package:abang/components/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/on_boarding_controller.dart';
import 'controllers/routes.dart';
import 'controllers/sign_up_page_controller.dart';
import 'view/authentication/sign_up_selection.dart';

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
            ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Abang',
              home: SignUpSelection(),
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
