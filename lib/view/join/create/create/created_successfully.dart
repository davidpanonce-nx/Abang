import 'package:abang/components/themes.dart';
import 'package:abang/main.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../components/constants.dart';
import '../../../../controllers/create_house_code_controller.dart';

class EstablishmentCreationSuccessful extends StatefulWidget {
  const EstablishmentCreationSuccessful({Key? key}) : super(key: key);

  @override
  State<EstablishmentCreationSuccessful> createState() =>
      _EstablishmentCreationSuccessfulState();
}

class _EstablishmentCreationSuccessfulState
    extends State<EstablishmentCreationSuccessful> {
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
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
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
                height: 150 / mockUpHeight * size.height,
              ),
              SvgPicture.asset(
                "assets/est_succ_create.svg",
              ),
              SizedBox(
                height: 30 / mockUpHeight * size.height,
              ),
              Text(
                "Establishment\nSuccessfully Created!",
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
              SizedBox(
                height: 30 / mockUpHeight * size.height,
              ),
              Container(
                height: 76 / mockUpHeight * size.height,
                width: 347 / mockUpWidth * size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: abangColors.abangWhite,
                    width: 2 / mockUpWidth * size.width,
                  ),
                  borderRadius:
                      BorderRadius.circular(5 / mockUpWidth * size.width),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        createHouseCodeController.houseCode ?? "",
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                            letterSpacing: 0.1,
                            color: abangColors.abangWhite,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70 / mockUpWidth * size.width,
                      ),
                      IconButton(
                        onPressed: () {
                          FlutterClipboard.copy(
                              createHouseCodeController.houseCode ?? "");
                        },
                        color: abangColors.abangWhite,
                        iconSize: 30 / mockUpWidth * size.width,
                        icon: const Icon(Icons.copy),
                      ),
                      SizedBox(
                        width: 16 / mockUpWidth * size.width,
                      ),
                    ],
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
