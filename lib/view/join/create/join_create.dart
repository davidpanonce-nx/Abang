import 'package:abang/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';
import '../../../components/themes.dart';
import '../../../controllers/create_house_code_controller.dart';
import 'create/create_house_code_wrapper.dart';
import 'join/become_a_tenant.dart';

class JoinCreateHouseCode extends StatefulWidget {
  const JoinCreateHouseCode({Key? key}) : super(key: key);

  @override
  State<JoinCreateHouseCode> createState() => _JoinCreateHouseCodeState();
}

class _JoinCreateHouseCodeState extends State<JoinCreateHouseCode>
    with FirebaseAuthentication {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
    return Scaffold(
      backgroundColor: abangColors.abangPrimary,
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: 161 / mockUpHeight * size.height,
                left: 64 / mockUpWidth * size.width,
                child: Column(
                  children: [
                    Text(
                      "Let's Get Started",
                      textScaleFactor: textScale,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          letterSpacing: 0.15,
                          color: abangColors.abangWhite,
                        ),
                      ),
                    ),
                    Text(
                      "What do you want to do?",
                      textScaleFactor: textScale,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: 0.15,
                            color: abangColors.abangWhite),
                      ),
                    ),
                    SizedBox(
                      height: 32 / mockUpHeight * size.height,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const BecomeATenant()),
                              ),
                            );
                          },
                          child: Container(
                            width: 100 / mockUpWidth * size.width,
                            height: 100 / mockUpWidth * size.width,
                            decoration: BoxDecoration(
                              color: abangColors.abangYellow,
                              borderRadius: BorderRadius.circular(
                                  20 / mockUpWidth * size.width),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/join_button.svg"),
                                SizedBox(
                                  height: 6 / mockUpHeight * size.height,
                                ),
                                Text(
                                  "Join",
                                  textScaleFactor: textScale,
                                  style: GoogleFonts.mulish(
                                    textStyle: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                      letterSpacing: 0.15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30 / mockUpWidth * size.width,
                        ),
                        InkWell(
                          onTap: () async {
                            await createHouseCodeController
                                .readJson()
                                .whenComplete(
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const CreateHouseCodeWrapper()),
                                    ),
                                  ),
                                );
                          },
                          child: Container(
                            width: 100 / mockUpWidth * size.width,
                            height: 100 / mockUpWidth * size.width,
                            decoration: BoxDecoration(
                              color: abangColors.abangYellow,
                              borderRadius: BorderRadius.circular(
                                  20 / mockUpWidth * size.width),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/create_button.svg"),
                                SizedBox(
                                  height: 6 / mockUpHeight * size.height,
                                ),
                                Text(
                                  "Create",
                                  textScaleFactor: textScale,
                                  style: GoogleFonts.mulish(
                                    textStyle: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                      letterSpacing: 0.15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 65 / mockUpWidth * size.width,
                child: SvgPicture.asset("assets/join_create.svg"),
              ),
              Positioned(
                top: 50 / mockUpHeight * size.height,
                right: 30 / mockUpWidth * size.width,
                child: IconButton(
                  onPressed: () async {
                    await signOut();
                  },
                  color: abangColors.abangYellow,
                  iconSize: 30 / mockUpWidth * size.width,
                  icon: const Icon(Icons.logout),
                ),
              ),
            ],
          )),
    );
  }
}
