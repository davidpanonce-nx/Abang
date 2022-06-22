import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/constants.dart';

class LandlordInvoices extends StatefulWidget {
  const LandlordInvoices({Key? key}) : super(key: key);

  @override
  State<LandlordInvoices> createState() => _LandlordInvoicesState();
}

class _LandlordInvoicesState extends State<LandlordInvoices> {
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
                  "Invoices",
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
                height: 15 / mockUpHeight * size.height,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20 / mockUpWidth * size.width),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // IconButton(
                    //   padding: EdgeInsets.zero,
                    //   onPressed: () {},
                    //   iconSize: 30 / mockUpWidth * size.width,
                    //   color: abangColors.abangWhite,
                    //   icon: const Icon(Icons.sort),
                    // ),
                    const SizedBox(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      iconSize: 30 / mockUpWidth * size.width,
                      color: abangColors.abangWhite,
                      icon: const Icon(Icons.add_box_outlined),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 40 / mockUpHeight * size.height,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "No Invoices Yet",
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
