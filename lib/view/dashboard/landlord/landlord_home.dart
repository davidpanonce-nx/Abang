import 'package:abang/components/recent_invoice_card.dart';
import 'package:abang/components/recent_tickets_card.dart';
import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/constants.dart';
import '../../../controllers/streams.dart';

class LandlordHome extends StatefulWidget {
  const LandlordHome({
    Key? key,
    required this.function,
    required this.houseCode,
  }) : super(key: key);

  final VoidCallback function;
  final String houseCode;
  @override
  State<LandlordHome> createState() => _LandlordHomeState();
}

class _LandlordHomeState extends State<LandlordHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: abangColors.abangPrimary),
      child: Stack(
        children: [
          Positioned(
            top: -329 / mockUpHeight * size.height,
            left: -103 / mockUpWidth * size.width,
            width: 671 / mockUpWidth * size.width,
            height: 816 / mockUpHeight * size.height,
            child: Image.asset('assets/blob_2.png'),
          ),
          SizedBox(
            width: size.width,
            height: size.height - 75 / mockUpHeight * size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20 / mockUpWidth * size.width),
                    child: SizedBox(
                      height: 40 / mockUpHeight * size.height,
                      width: 335 / mockUpWidth * size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async {
                              widget.function();
                            },
                            color: abangColors.abangWhite,
                            iconSize: 30 / mockUpWidth * size.width,
                            icon: const Icon(
                              Icons.menu,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            color: abangColors.abangWhite,
                            iconSize: 30 / mockUpWidth * size.width,
                            icon: const Icon(
                              Icons.notifications,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30 / mockUpHeight * size.height,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 33 / mockUpWidth * size.width),
                      child: Row(
                        children: [
                          Text(
                            'WELCOME ',
                            textScaleFactor: textScale,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.25,
                                letterSpacing: 0.0,
                                color: abangColors.abangWhite,
                              ),
                            ),
                          ),
                          StreamBuilder<String>(
                              stream:
                                  DataStreams(widget.houseCode).firstNameData,
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text(
                                    'LANDLORD!',
                                    textScaleFactor: textScale,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        height: 1.25,
                                        letterSpacing: 0.0,
                                        color: abangColors.abangWhite,
                                      ),
                                    ),
                                  );
                                } else {
                                  if (snapshot.hasData) {
                                    return Text(
                                      "${snapshot.data!.toUpperCase()}!",
                                      textScaleFactor: textScale,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.outfit(
                                        textStyle: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          height: 1.25,
                                          letterSpacing: 0.0,
                                          color: abangColors.abangWhite,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      'LANDLORD!',
                                      textScaleFactor: textScale,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.outfit(
                                        textStyle: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          height: 1.25,
                                          letterSpacing: 0.0,
                                          color: abangColors.abangWhite,
                                        ),
                                      ),
                                    );
                                  }
                                }
                              })),
                        ],
                      )),
                  SizedBox(
                    height: 15 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 33 / mockUpWidth * size.width),
                    child: Text(
                      'Your current establishment,',
                      textScaleFactor: textScale,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          height: 1.25,
                          letterSpacing: 0.0,
                          color: abangColors.abangWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 33 / mockUpWidth * size.width),
                    child: StreamBuilder<String>(
                        stream: DataStreams(widget.houseCode).estNameData,
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              'ESTABLISHMENT!',
                              textScaleFactor: textScale,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                  letterSpacing: 0.0,
                                  color: abangColors.abangWhite,
                                ),
                              ),
                            );
                          } else {
                            if (snapshot.hasData) {
                              return Text(
                                "${snapshot.data!.toUpperCase()}!",
                                textScaleFactor: textScale,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.outfit(
                                  textStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    height: 1.25,
                                    letterSpacing: 0.0,
                                    color: abangColors.abangWhite,
                                  ),
                                ),
                              );
                            } else {
                              return Text(
                                'ESTABLISHMENT!',
                                textScaleFactor: textScale,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.outfit(
                                  textStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    height: 1.25,
                                    letterSpacing: 0.0,
                                    color: abangColors.abangWhite,
                                  ),
                                ),
                              );
                            }
                          }
                        })),
                  ),
                  SizedBox(
                    height: 15 / mockUpHeight * size.height,
                  ),
                  SizedBox(
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
                                borderRadius: BorderRadius.circular(
                                    10 / mockUpWidth * size.width),
                              ),
                              child: Center(
                                child: StreamBuilder<int>(
                                    stream: DataStreams(widget.houseCode)
                                        .occupiedData,
                                    builder: ((context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text(
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
                                        );
                                      } else {
                                        if (snapshot.hasData) {
                                          return Text(
                                            snapshot.data!.toString(),
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
                                          );
                                        } else {
                                          return Text(
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
                                          );
                                        }
                                      }
                                    })),
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
                                borderRadius: BorderRadius.circular(
                                    10 / mockUpWidth * size.width),
                              ),
                              child: Center(
                                child: StreamBuilder<int>(
                                    stream: DataStreams(widget.houseCode)
                                        .vacantData,
                                    builder: ((context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text(
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
                                        );
                                      } else {
                                        if (snapshot.hasData) {
                                          return Text(
                                            snapshot.data!.toString(),
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
                                          );
                                        } else {
                                          return Text(
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
                                          );
                                        }
                                      }
                                    })),
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
                                borderRadius: BorderRadius.circular(
                                    10 / mockUpWidth * size.width),
                              ),
                              child: Center(
                                child: StreamBuilder<int>(
                                    stream: DataStreams(widget.houseCode)
                                        .tenantData,
                                    builder: ((context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text(
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
                                        );
                                      } else {
                                        if (snapshot.hasData) {
                                          return Text(
                                            snapshot.data!.toString(),
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
                                          );
                                        } else {
                                          return Text(
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
                                          );
                                        }
                                      }
                                    })),
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
                  ),
                  SizedBox(
                    height: 15 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 33 / mockUpWidth * size.width),
                    child: Text(
                      'Date Created: 2022-06-05',
                      textScaleFactor: textScale,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          height: 1.25,
                          letterSpacing: 0.0,
                          color: abangColors.abangWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 24 / mockUpWidth * size.width),
                    child: Text(
                      'Recent Invoices',
                      textScaleFactor: textScale,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                          letterSpacing: 0.0,
                          color: abangColors.abangWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10 / mockUpHeight * size.height,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 136 / mockUpHeight * size.height,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24 / mockUpWidth * size.width),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(left: 0)
                                : EdgeInsets.only(
                                    left: 10 / mockUpWidth * size.width,
                                  ),
                            child: const RecentInvoiceCard(
                              invoiceNumber: "INV#2022-00001",
                              dateCreated: "2022-06-05",
                              status: "Pending",
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 30 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 24 / mockUpWidth * size.width),
                    child: Text(
                      'Recent Tickets',
                      textScaleFactor: textScale,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                          letterSpacing: 0.0,
                          color: abangColors.abangWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10 / mockUpHeight * size.height,
                  ),
                  const Center(
                    child: Column(
                      children: [
                        RecentTicketCard(
                            ticketNumber: "T#001-2022",
                            subject: "Subject",
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis, condimentum proin in ullamcorper risus facilisi. Cursus gravida lobortis ac quam et eu sagittis, et nibh . . .",
                            status: "Pending"),
                        RecentTicketCard(
                            ticketNumber: "T#001-2022",
                            subject: "Subject",
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis, condimentum proin in ullamcorper risus facilisi. Cursus gravida lobortis ac quam et eu sagittis, et nibh . . .",
                            status: "Pending"),
                        RecentTicketCard(
                            ticketNumber: "T#001-2022",
                            subject: "Subject",
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis, condimentum proin in ullamcorper risus facilisi. Cursus gravida lobortis ac quam et eu sagittis, et nibh . . .",
                            status: "Pending"),
                        RecentTicketCard(
                            ticketNumber: "T#001-2022",
                            subject: "Subject",
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis, condimentum proin in ullamcorper risus facilisi. Cursus gravida lobortis ac quam et eu sagittis, et nibh . . .",
                            status: "Pending"),
                        RecentTicketCard(
                            ticketNumber: "T#001-2022",
                            subject: "Subject",
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis, condimentum proin in ullamcorper risus facilisi. Cursus gravida lobortis ac quam et eu sagittis, et nibh . . .",
                            status: "Pending"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
