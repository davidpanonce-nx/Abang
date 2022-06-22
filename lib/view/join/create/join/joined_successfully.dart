import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../components/constants.dart';
import '../../../../components/themes.dart';
import '../../../../main.dart';

class JoinedSuccessfully extends StatefulWidget {
  const JoinedSuccessfully({Key? key}) : super(key: key);

  @override
  State<JoinedSuccessfully> createState() => _JoinedSuccessfullyState();
}

class _JoinedSuccessfullyState extends State<JoinedSuccessfully> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).whenComplete(() =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AbangAuthWrapper())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;

    return Scaffold(
      backgroundColor: abangColors.abangPrimary,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 180 / mockUpHeight * size.height,
              ),
              SvgPicture.asset(
                "assets/joined_suc.svg",
              ),
              SizedBox(
                height: 30 / mockUpHeight * size.height,
              ),
              Text(
                "Successfully Joined\nHouse Code",
                textScaleFactor: textScale,
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    letterSpacing: 0,
                    color: abangColors.abangWhite,
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
