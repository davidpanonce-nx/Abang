import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class RecentInvoiceCard extends StatelessWidget {
  const RecentInvoiceCard({
    Key? key,
    required this.invoiceNumber,
    required this.dateCreated,
    required this.status,
  }) : super(key: key);

  final String invoiceNumber;
  final String dateCreated;
  final String status;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Container(
      width: 120 / mockUpWidth * size.width,
      height: 136 / mockUpHeight * size.height,
      decoration: BoxDecoration(
        color: abangColors.abangYellow,
        borderRadius: BorderRadius.circular(10 / mockUpWidth * size.width),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15 / mockUpWidth * size.width),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            invoiceNumber,
            textScaleFactor: textScale,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 1.20,
                letterSpacing: 0.15,
                color: abangColors.abangPrimary,
              ),
            ),
          ),
          SizedBox(
            height: 10 / mockUpHeight * size.height,
          ),
          Text(
            dateCreated,
            textScaleFactor: textScale,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 10,
                fontWeight: FontWeight.w300,
                height: 1.20,
                letterSpacing: 0.15,
                color: abangColors.abangPrimary,
              ),
            ),
          ),
          Text(
            status,
            textScaleFactor: textScale,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                height: 1.20,
                letterSpacing: 0.15,
                color: abangColors.abangPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
