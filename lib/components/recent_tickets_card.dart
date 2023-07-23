import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class RecentTicketCard extends StatelessWidget {
  const RecentTicketCard({
    Key? key,
    required this.ticketNumber,
    required this.subject,
    required this.description,
    required this.status,
  }) : super(key: key);

  final String ticketNumber;
  final String subject;
  final String description;
  final String status;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Container(
      width: 335 / mockUpWidth * size.width,
      decoration: BoxDecoration(
        color: abangColors.abangWhite,
        borderRadius: BorderRadius.circular(
          5 / mockUpWidth * size.width,
        ),
        boxShadow: [
          BoxShadow(
            color: abangColors.abangPrimary.withOpacity(0.30),
            offset: Offset(
                -1 / mockUpWidth * size.width, 1 / mockUpHeight * size.height),
            blurRadius: 1 / mockUpWidth * size.width,
            spreadRadius: 1 / mockUpWidth * size.width,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.5 / mockUpWidth * size.width,
        vertical: 13 / mockUpHeight * size.height,
      ),
      margin: EdgeInsets.only(bottom: 10 / mockUpHeight * size.height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$ticketNumber | $subject",
            textScaleFactor: textScale,
            textAlign: TextAlign.left,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.20,
                letterSpacing: 0.15,
                color: abangColors.abangPrimary,
              ),
            ),
          ),
          SizedBox(
            height: 2 / mockUpHeight * size.height,
          ),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: textScale,
            textAlign: TextAlign.left,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 13,
                fontWeight: FontWeight.w300,
                height: 1.20,
                letterSpacing: 0.15,
                color: abangColors.abangPrimary,
              ),
            ),
          ),
          SizedBox(
            height: 4 / mockUpHeight * size.height,
          ),
          Container(
            padding: EdgeInsets.all(2 / mockUpWidth * size.width),
            decoration: BoxDecoration(
              color: abangColors.abangSecondary,
              borderRadius: BorderRadius.circular(2 / mockUpWidth * size.width),
            ),
            child: Text(
              status,
              textScaleFactor: textScale,
              textAlign: TextAlign.left,
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 1.20,
                  letterSpacing: 0.15,
                  color: abangColors.abangPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
