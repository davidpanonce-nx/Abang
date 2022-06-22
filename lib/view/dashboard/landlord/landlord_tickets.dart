import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/constants.dart';
import '../../../components/themes.dart';

class LandlordTickets extends StatefulWidget {
  const LandlordTickets({Key? key}) : super(key: key);

  @override
  State<LandlordTickets> createState() => _LandlordTicketsState();
}

class _LandlordTicketsState extends State<LandlordTickets> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Container(
        width: size.width,
        height: size.height - 75 / mockUpHeight * size.height,
        decoration: BoxDecoration(color: abangColors.abangPrimary),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70 / mockUpHeight * size.height,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30 / mockUpWidth * size.width),
                child: Text(
                  "Tickets",
                  textScaleFactor: textScale,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      letterSpacing: 0.0,
                      color: abangColors.abangWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30 / mockUpHeight * size.height,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: 20 / mockUpWidth * size.width),
              //   child: IconButton(
              //     padding: EdgeInsets.zero,
              //     onPressed: () {},
              //     iconSize: 30 / mockUpWidth * size.width,
              //     color: abangColors.abangWhite,
              //     icon: const Icon(Icons.sort),
              //   ),
              // ),
              Column(
                children: [
                  SizedBox(
                    height: 40 / mockUpHeight * size.height,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "No Tickets Yet",
                      textScaleFactor: textScale,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          letterSpacing: 0.0,
                          color: abangColors.abangWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 / mockUpHeight * size.height,
                  ),
                  SvgPicture.asset("assets/empty_state.svg"),
                ],
              )
            ],
          ),
        ));
  }
}
