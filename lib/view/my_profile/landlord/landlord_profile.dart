import 'package:abang/components/loading.dart';
import 'package:abang/controllers/streams.dart';
import 'package:abang/view/my_profile/landlord/what_to_edit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/constants.dart';
import '../../../components/themes.dart';
import '../../../models/models.dart';

class LandLordProfile extends StatelessWidget {
  const LandLordProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return StreamBuilder<AbangUser>(
        stream: DataStreams("").userDataStream,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AbangLoading();
          } else {
            if (snapshot.hasData) {
              return Scaffold(
                backgroundColor: abangColors.abangPrimary,
                body: Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.symmetric(
                    vertical: 50 / mockUpHeight * size.height,
                    horizontal: 20 / mockUpWidth * size.width,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 30 / mockUpWidth * size.width,
                              color: abangColors.abangWhite,
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        WhatToEdit(userData: snapshot.data!),
                                  ),
                                );
                              },
                              child: Text(
                                "Edit",
                                textScaleFactor: textScale,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  textStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    height: 1.0,
                                    letterSpacing: 0.0,
                                    color: abangColors.abangWhite,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20 / mockUpHeight * size.height,
                        ),
                        SizedBox(
                          width: 327 / mockUpWidth * size.width,
                          height: 196 / mockUpHeight * size.height,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 327 / mockUpWidth * size.width,
                                height: 196 / mockUpHeight * size.height,
                                decoration: BoxDecoration(
                                  color: abangColors.abangSecondary,
                                  borderRadius: BorderRadius.circular(
                                    20 / mockUpWidth * size.width,
                                  ),
                                ),
                              ),
                              Container(
                                width: 130 / mockUpWidth * size.width,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 5 / mockUpWidth * size.width,
                                      color: abangColors.abangWhite,
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                      snapshot.data!.avatarURL,
                                    ))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10 / mockUpHeight * size.height,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 123 / mockUpWidth * size.width,
                            height: 60 / mockUpHeight * size.height,
                            decoration: BoxDecoration(
                              color: abangColors.abangYellow,
                              borderRadius: BorderRadius.circular(
                                5 / mockUpWidth * size.width,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Landlord",
                                textScaleFactor: textScale,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  textStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    height: 1.0,
                                    letterSpacing: 0.15,
                                    color: abangColors.abangPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30 / mockUpHeight * size.height,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  textScaleFactor: textScale,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.outfit(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      height: 1.0,
                                      letterSpacing: 0.15,
                                      color: abangColors.abangWhite,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20 / mockUpWidth * size.width),
                                  child: Text(
                                    "${snapshot.data!.firstName} ${snapshot.data!.middleName ?? ""} ${snapshot.data!.lastName}",
                                    textScaleFactor: textScale,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 1.0,
                                        letterSpacing: 0.15,
                                        color: abangColors.abangWhite,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20 / mockUpHeight * size.height,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  textScaleFactor: textScale,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.outfit(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      height: 1.0,
                                      letterSpacing: 0.15,
                                      color: abangColors.abangWhite,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20 / mockUpWidth * size.width),
                                  child: Text(
                                    snapshot.data!.email,
                                    textScaleFactor: textScale,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 1.0,
                                        letterSpacing: 0.15,
                                        color: abangColors.abangWhite,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20 / mockUpHeight * size.height,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact Number',
                                  textScaleFactor: textScale,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.outfit(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      height: 1.0,
                                      letterSpacing: 0.15,
                                      color: abangColors.abangWhite,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20 / mockUpWidth * size.width),
                                  child: Text(
                                    snapshot.data!.contactNumber,
                                    textScaleFactor: textScale,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 1.0,
                                        letterSpacing: 0.15,
                                        color: abangColors.abangWhite,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20 / mockUpHeight * size.height,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Address',
                                  textScaleFactor: textScale,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.outfit(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      height: 1.0,
                                      letterSpacing: 0.15,
                                      color: abangColors.abangWhite,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20 / mockUpWidth * size.width),
                                  child: Text(
                                    snapshot.data!.province != ""
                                        ? "${snapshot.data!.barangay},${snapshot.data!.city},${snapshot.data!.province}, ${snapshot.data!.region}"
                                        : "${snapshot.data!.barangay}, ${snapshot.data!.city}, ${snapshot.data!.region}",
                                    textScaleFactor: textScale,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 1.0,
                                        letterSpacing: 0.15,
                                        color: abangColors.abangWhite,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20 / mockUpHeight * size.height,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'E-Signature',
                                  textScaleFactor: textScale,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.outfit(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      height: 1.0,
                                      letterSpacing: 0.15,
                                      color: abangColors.abangWhite,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                                Image.network(
                                  snapshot.data!.signatureURL,
                                  scale: size.width / mockUpWidth,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const AbangLoading();
            }
          }
        }));
  }
}
