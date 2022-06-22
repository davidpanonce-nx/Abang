import 'package:abang/components/loading.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/controllers/streams.dart';
import 'package:abang/services/firebase_auth.dart';
import 'package:abang/view/dashboard/landlord/landlord_home.dart';
import 'package:abang/view/dashboard/landlord/landlord_invoices.dart';
import 'package:abang/view/dashboard/landlord/landlord_tickets.dart';
import 'package:abang/view/my_profile/landlord/landlord_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';
import '../../../controllers/bottom_nav_controller.dart';

class LandLord extends StatefulWidget with FirebaseAuthentication {
  const LandLord({Key? key}) : super(key: key);

  @override
  State<LandLord> createState() => _LandLordState();
}

class _LandLordState extends State<LandLord> with FirebaseAuthentication {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldkey.currentState!.openDrawer();
  }

  String houseCode = "";

  Future<String> getHouseCode() async {
    return await FirebaseFirestore.instance
        .collection("House Codes")
        .where("landlordID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      return value.docs.first.id;
    });
  }

  Future<void> getData() async {
    houseCode = await getHouseCode();
    setState(() {});
  }

  @override
  void initState() {
    getData().whenComplete(() {
      Future.delayed(const Duration(seconds: 3)).whenComplete(() {
        setState(() {
          isLoading = false;
        });
      });
    });
    super.initState();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final bottomNavController = Provider.of<PageControllers>(context);
    return isLoading
        ? const AbangLoading(text: "Loading All Data")
        : Scaffold(
            key: _scaffoldkey,
            drawer: Container(
              width: 282 / mockUpWidth * size.width,
              decoration: BoxDecoration(
                color: abangColors.abangPrimary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    5 / mockUpWidth * size.width,
                  ),
                  bottomRight: Radius.circular(
                    5 / mockUpWidth * size.width,
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 35 / mockUpHeight * size.height,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      padding:
                          EdgeInsets.only(right: 25 / mockUpWidth * size.width),
                      onPressed: () {
                        _scaffoldkey.currentState!.closeDrawer();
                      },
                      iconSize: 30 / mockUpWidth * size.width,
                      color: abangColors.abangWhite,
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  SizedBox(
                    height: 40 / mockUpHeight * size.height,
                  ),
                  StreamBuilder<String>(
                      stream: DataStreams("").avatarData,
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            width: 180 / mockUpWidth * size.width,
                            decoration: BoxDecoration(
                              color: abangColors.abangWhite,
                              shape: BoxShape.circle,
                            ),
                            child: CircularProgressIndicator(
                              color: abangColors.abangPrimary,
                            ),
                          );
                        } else {
                          if (snapshot.hasData) {
                            return Container(
                              width: 180 / mockUpWidth * size.width,
                              height: 180 / mockUpWidth * size.width,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 5 / mockUpWidth * size.width,
                                  color: abangColors.abangWhite,
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                snapshot.data!,
                                isAntiAlias: true,
                                fit: BoxFit.cover,
                              ),
                            );
                          } else {
                            return Container(
                              width: 180 / mockUpWidth * size.width,
                              decoration: BoxDecoration(
                                color: abangColors.abangWhite,
                                shape: BoxShape.circle,
                              ),
                              child: CircularProgressIndicator(
                                color: abangColors.abangPrimary,
                              ),
                            );
                          }
                        }
                      })),
                  SizedBox(
                    height: 40 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 21 / mockUpWidth * size.width),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LandLordProfile(),
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/my_profile.svg'),
                          SizedBox(
                            width: 7 / mockUpWidth * size.width,
                          ),
                          Text(
                            "My Profile",
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
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 21 / mockUpWidth * size.width),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/suggestions.svg'),
                          SizedBox(
                            width: 7 / mockUpWidth * size.width,
                          ),
                          Text(
                            "Suggestions",
                            textScaleFactor: textScale,
                            textAlign: TextAlign.center,
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
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 21 / mockUpWidth * size.width),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/tenants.svg'),
                          SizedBox(
                            width: 7 / mockUpWidth * size.width,
                          ),
                          Text(
                            "Tenants",
                            textScaleFactor: textScale,
                            textAlign: TextAlign.center,
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
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 / mockUpHeight * size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 21 / mockUpWidth * size.width),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/houseCode.svg'),
                          SizedBox(
                            width: 7 / mockUpWidth * size.width,
                          ),
                          Text(
                            "House Code",
                            textScaleFactor: textScale,
                            textAlign: TextAlign.center,
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
                          )
                        ],
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 21 / mockUpWidth * size.width,
                      bottom: 40 / mockUpHeight * size.height,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await signOut();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/logOut.svg'),
                          SizedBox(
                            width: 7 / mockUpWidth * size.width,
                          ),
                          Text(
                            "Log Out",
                            textScaleFactor: textScale,
                            textAlign: TextAlign.center,
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: abangColors.abangPrimary,
            bottomNavigationBar: LandLordBottomNavigationBar(
              size: size,
            ),
            body: bottomNavController.bottomNavIndex == 0
                ? LandlordHome(
                    function: _openDrawer,
                    houseCode: houseCode,
                  )
                : bottomNavController.bottomNavIndex == 1
                    ? const LandlordInvoices()
                    : const LandlordTickets(),
          );
  }
}

class LandLordBottomNavigationBar extends StatelessWidget {
  const LandLordBottomNavigationBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final textScale = size.width / mockUpWidth;
    final _bottomNavController = Provider.of<PageControllers>(context);
    return Container(
      width: size.width,
      height: 75 / mockUpHeight * size.height,
      decoration: BoxDecoration(
        color: abangColors.abangWhite,
      ),
      padding: EdgeInsets.fromLTRB(
        55 / mockUpWidth * size.width,
        15 / mockUpHeight * size.height,
        39 / mockUpWidth * size.width,
        15 / mockUpHeight * size.height,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => _bottomNavController.setBottomNavIndex(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24 / mockUpWidth * size.width,
                  height: 24 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/home.svg",
                      color: _bottomNavController.bottomNavIndex == 0
                          ? abangColors.abangPrimary
                          : abangColors.abangPrimary.withOpacity(0.40),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6 / mockUpHeight * size.height,
                ),
                Text(
                  "Home",
                  textScaleFactor: textScale,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      height: 0.80,
                      letterSpacing: 0,
                      color: _bottomNavController.bottomNavIndex == 0
                          ? abangColors.abangPrimary
                          : abangColors.abangPrimary.withOpacity(0.40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 81 / mockUpWidth * size.width,
          ),
          InkWell(
            onTap: () => _bottomNavController.setBottomNavIndex(1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24 / mockUpWidth * size.width,
                  height: 24 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/invoices.svg",
                      color: _bottomNavController.bottomNavIndex == 1
                          ? abangColors.abangPrimary
                          : abangColors.abangPrimary.withOpacity(0.40),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6 / mockUpHeight * size.height,
                ),
                Text(
                  "Invoices",
                  textScaleFactor: textScale,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      height: 0.80,
                      letterSpacing: 0,
                      color: _bottomNavController.bottomNavIndex == 1
                          ? abangColors.abangPrimary
                          : abangColors.abangPrimary.withOpacity(0.40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 65 / mockUpWidth * size.width,
          ),
          InkWell(
            onTap: () => _bottomNavController.setBottomNavIndex(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24 / mockUpWidth * size.width,
                  height: 24 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/tickets.svg",
                      color: _bottomNavController.bottomNavIndex == 2
                          ? abangColors.abangPrimary
                          : abangColors.abangPrimary.withOpacity(0.40),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6 / mockUpHeight * size.height,
                ),
                Text(
                  "Tickets",
                  textScaleFactor: textScale,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      height: 0.80,
                      letterSpacing: 0,
                      color: _bottomNavController.bottomNavIndex == 2
                          ? abangColors.abangPrimary
                          : abangColors.abangPrimary.withOpacity(0.40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
