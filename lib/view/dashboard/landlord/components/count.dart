import 'package:abang/components/constants.dart';
import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandLordDashboardCount extends StatelessWidget {
  const LandLordDashboardCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80 / mockUpWidth * size.width,
                height: 100 / mockUpHeight * size.height,
                decoration: BoxDecoration(
                  color: abangColors.abangWhite,
                  borderRadius:
                      BorderRadius.circular(10 / mockUpWidth * size.width),
                ),
                child: Center(
                  child: Text(
                    "0",
                    textScaleFactor: textScale,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 64,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        letterSpacing: 0.0,
                        color: abangColors.abangPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5 / mockUpHeight * size.height,
              ),
              Text(
                "Occupied",
                textScaleFactor: textScale,
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                    letterSpacing: 0.0,
                    color: abangColors.abangWhite,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 5 / mockUpWidth * size.width,
          ),
          Text(
            ":",
            textScaleFactor: textScale,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 64,
                fontWeight: FontWeight.w700,
                height: 0.5,
                letterSpacing: 0.0,
                color: abangColors.abangWhite,
              ),
            ),
          ),
          SizedBox(
            width: 5 / mockUpWidth * size.width,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80 / mockUpWidth * size.width,
                height: 100 / mockUpHeight * size.height,
                decoration: BoxDecoration(
                  color: abangColors.abangWhite,
                  borderRadius:
                      BorderRadius.circular(10 / mockUpWidth * size.width),
                ),
                child: Center(
                  child: Text(
                    "0",
                    textScaleFactor: textScale,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 64,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        letterSpacing: 0.0,
                        color: abangColors.abangPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5 / mockUpHeight * size.height,
              ),
              Text(
                "Vacant",
                textScaleFactor: textScale,
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                    letterSpacing: 0.0,
                    color: abangColors.abangWhite,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 5 / mockUpWidth * size.width,
          ),
          Text(
            ":",
            textScaleFactor: textScale,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 64,
                fontWeight: FontWeight.w700,
                height: 0.5,
                letterSpacing: 0.0,
                color: abangColors.abangWhite,
              ),
            ),
          ),
          SizedBox(
            width: 5 / mockUpWidth * size.width,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80 / mockUpWidth * size.width,
                height: 100 / mockUpHeight * size.height,
                decoration: BoxDecoration(
                  color: abangColors.abangWhite,
                  borderRadius:
                      BorderRadius.circular(10 / mockUpWidth * size.width),
                ),
                child: Center(
                  child: Text(
                    "0",
                    textScaleFactor: textScale,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 64,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        letterSpacing: 0.0,
                        color: abangColors.abangPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5 / mockUpHeight * size.height,
              ),
              Text(
                "Tenants",
                textScaleFactor: textScale,
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                    letterSpacing: 0.0,
                    color: abangColors.abangWhite,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
