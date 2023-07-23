import 'package:abang/components/loading.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/controllers/join_house_code_controller.dart';
import 'package:abang/services/firestore_db.dart';
import 'package:abang/view/join/create/join/joined_successfully.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../components/constants.dart';
import '../../../../models/models.dart';

class BecomeATenant extends StatefulWidget {
  const BecomeATenant({Key? key}) : super(key: key);

  @override
  State<BecomeATenant> createState() => _BecomeATenantState();
}

class _BecomeATenantState extends State<BecomeATenant>
    with FirestoreDataServices {
  late TextEditingController _houseCodeController;
  late TextEditingController _roomNumberController;
  late TextEditingController _dateController;

  @override
  void initState() {
    _houseCodeController = TextEditingController();
    _roomNumberController = TextEditingController();
    _dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _houseCodeController.dispose();
    _roomNumberController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final joinHouseCodeController =
        Provider.of<JoinHouseCodeController>(context);

    return joinHouseCodeController.isLoading
        ? const AbangLoading(text: "Joining House Code")
        : Scaffold(
            backgroundColor: abangColors.abangPrimary,
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 60 / mockUpHeight * size.height,
                        left: 20 / mockUpWidth * size.width,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: abangColors.abangYellow,
                          iconSize: 30 / mockUpWidth * size.width,
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 64 / mockUpHeight * size.height,
                          ),
                          SvgPicture.asset("assets/become_a_tenant.svg"),
                          Text(
                            "Live and join a house code to become a tenant",
                            textScaleFactor: textScale,
                            style: abangTextStyles.smallTextStyle.copyWith(
                              fontSize: 14,
                              height: 1.5,
                              letterSpacing: -0.01,
                              color: abangColors.abangWhite,
                            ),
                          ),
                          SizedBox(
                            height: 19 / mockUpHeight * size.height,
                          ),
                          Expanded(
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                color: abangColors.abangSecondary,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      50 / mockUpWidth * size.width),
                                  topRight: Radius.circular(
                                      50 / mockUpWidth * size.width),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 30 / mockUpHeight * size.height,
                                      ),
                                      Text(
                                        "Become a Tenant",
                                        textScaleFactor: textScale,
                                        style: abangTextStyles.titleTextStyle
                                            .copyWith(
                                          height: 1.5,
                                          letterSpacing: -0.01,
                                          color: abangColors.abangWhite,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30 / mockUpHeight * size.height,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 11.5 /
                                                mockUpWidth *
                                                size.width),
                                        child: TextFormField(
                                          cursorColor: abangColors.abangPrimary,
                                          cursorHeight:
                                              20 / mockUpHeight * size.height,
                                          controller: _houseCodeController,
                                          style: abangTextStyles.smallTextStyle
                                              .copyWith(
                                                  color:
                                                      abangColors.abangPrimary),
                                          validator: (val) {
                                            if (val == null || val.isEmpty) {
                                              return "Please enter a house code";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            isCollapsed: true,
                                            filled: true,
                                            fillColor: abangColors.abangWhite,
                                            contentPadding: EdgeInsets.fromLTRB(
                                              20 / mockUpWidth * size.width,
                                              20 / mockUpHeight * size.height,
                                              20 / mockUpWidth * size.width,
                                              20 / mockUpHeight * size.height,
                                            ),
                                            hintText: "House Code",
                                            hintStyle: abangTextStyles
                                                .smallTextStyle
                                                .copyWith(
                                              color: abangColors.abangPrimary
                                                  .withOpacity(0.50),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: const BorderSide(
                                                width: 0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: const BorderSide(
                                                width: 0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: BorderSide(
                                                color:
                                                    abangColors.abangSecondary,
                                                width: 2.0 /
                                                    mockUpWidth *
                                                    size.width,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: BorderSide(
                                                color:
                                                    abangColors.abangSecondary,
                                                width: 2.0 /
                                                    mockUpWidth *
                                                    size.width,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 / mockUpHeight * size.height,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 11.5 /
                                                mockUpWidth *
                                                size.width),
                                        child: TextFormField(
                                          cursorColor: abangColors.abangPrimary,
                                          cursorHeight:
                                              20 / mockUpHeight * size.height,
                                          controller: _roomNumberController,
                                          style: abangTextStyles.smallTextStyle
                                              .copyWith(
                                                  color:
                                                      abangColors.abangPrimary),
                                          keyboardType: TextInputType.number,
                                          validator: (val) {
                                            if (val == null || val.isEmpty) {
                                              return "Please enter a room number";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            isCollapsed: true,
                                            filled: true,
                                            fillColor: abangColors.abangWhite,
                                            contentPadding: EdgeInsets.fromLTRB(
                                              20 / mockUpWidth * size.width,
                                              20 / mockUpHeight * size.height,
                                              20 / mockUpWidth * size.width,
                                              20 / mockUpHeight * size.height,
                                            ),
                                            hintText: "Room Number",
                                            hintStyle: abangTextStyles
                                                .smallTextStyle
                                                .copyWith(
                                              color: abangColors.abangPrimary
                                                  .withOpacity(0.50),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: const BorderSide(
                                                width: 0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: const BorderSide(
                                                width: 0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: BorderSide(
                                                color:
                                                    abangColors.abangSecondary,
                                                width: 2.0 /
                                                    mockUpWidth *
                                                    size.width,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: BorderSide(
                                                color:
                                                    abangColors.abangSecondary,
                                                width: 2.0 /
                                                    mockUpWidth *
                                                    size.width,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8 / mockUpHeight * size.height,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 11.5 /
                                                mockUpWidth *
                                                size.width),
                                        child: TextFormField(
                                          cursorColor: abangColors.abangPrimary,
                                          cursorHeight:
                                              20 / mockUpHeight * size.height,
                                          controller: _dateController,
                                          style: abangTextStyles.smallTextStyle
                                              .copyWith(
                                            color: abangColors.abangPrimary,
                                          ),
                                          validator: (val) {
                                            if (val == null || val.isEmpty) {
                                              return "Please enter a billing date";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            isCollapsed: true,
                                            filled: true,
                                            fillColor: abangColors.abangWhite,
                                            contentPadding: EdgeInsets.fromLTRB(
                                              20 / mockUpWidth * size.width,
                                              20 / mockUpHeight * size.height,
                                              20 / mockUpWidth * size.width,
                                              20 / mockUpHeight * size.height,
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () async {
                                                await showDialog<Timestamp>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                      child: Container(
                                                        width: 300 /
                                                            mockUpWidth *
                                                            size.width,
                                                        height: 400 /
                                                            mockUpHeight *
                                                            size.height,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: abangColors
                                                              .abangWhite,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5 /
                                                                mockUpWidth *
                                                                size.width,
                                                          ),
                                                        ),
                                                        padding: EdgeInsets.all(
                                                          10 /
                                                              mockUpWidth *
                                                              size.width,
                                                        ),
                                                        child:
                                                            SfDateRangePicker(
                                                          onCancel: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          onSubmit:
                                                              (value) async {
                                                            joinHouseCodeController
                                                                .setBillingDate(
                                                                    value);
                                                            Navigator.pop(
                                                                context);
                                                            _dateController =
                                                                TextEditingController(
                                                              text: joinHouseCodeController
                                                                  .billingDate
                                                                  .toString()
                                                                  .split(" ")
                                                                  .first,
                                                            );
                                                          },
                                                          showActionButtons:
                                                              true,
                                                          showNavigationArrow:
                                                              true,
                                                          confirmText: "SELECT",
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              color: abangColors.abangPrimary,
                                              iconSize:
                                                  24 / mockUpWidth * size.width,
                                              icon: const Icon(
                                                Icons.calendar_today,
                                              ),
                                            ),
                                            hintText: "Billing Date",
                                            hintStyle: abangTextStyles
                                                .smallTextStyle
                                                .copyWith(
                                              color: abangColors.abangPrimary
                                                  .withOpacity(0.50),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: const BorderSide(
                                                width: 0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: const BorderSide(
                                                width: 0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: BorderSide(
                                                color:
                                                    abangColors.abangSecondary,
                                                width: 2.0 /
                                                    mockUpWidth *
                                                    size.width,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5 /
                                                      mockUpWidth *
                                                      size.width),
                                              borderSide: BorderSide(
                                                color:
                                                    abangColors.abangSecondary,
                                                width: 2.0 /
                                                    mockUpWidth *
                                                    size.width,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            joinHouseCodeController.hasError ??
                                                false,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top:
                                                50 / mockUpHeight * size.height,
                                          ),
                                          child: Text(
                                            "Error House Code",
                                            textScaleFactor: textScale,
                                            style: abangTextStyles
                                                .smallTextStyle
                                                .copyWith(
                                                    color:
                                                        abangColors.abangYellow,
                                                    fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12 / mockUpWidth * size.width,
                                      vertical: 50 / mockUpHeight * size.height,
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        joinHouseCodeController
                                            .setIsLoading(true);
                                        String? landLordID;
                                        landLordID =
                                            await checkUserRoleIfExists(
                                                _houseCodeController.text
                                                    .trim());
                                        AbangUser user =
                                            await getUserDataToUpdateRole(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid);

                                        AbangUser newUserData = AbangUser(
                                          userID: user.userID,
                                          role: "TENANT",
                                          dateCreated: user.dateCreated,
                                          userInfoID: user.userInfoID,
                                          firstName: user.firstName,
                                          lastName: user.lastName,
                                          contactNumber: user.contactNumber,
                                          avatarURL: user.avatarURL,
                                          signatureURL: user.signatureURL,
                                          email: user.email,
                                          locationID: user.locationID,
                                          region: user.region,
                                          city: user.city,
                                          barangay: user.barangay,
                                        );

                                        await updateUserRole(
                                                newUserData.toMap(),
                                                FirebaseAuth
                                                    .instance.currentUser!.uid)
                                            .whenComplete(() async {
                                          if (landLordID != null) {
                                            await createATenantData(
                                              {
                                                "landLordID": landLordID,
                                                "houseCode":
                                                    _houseCodeController.text
                                                        .trim(),
                                                "tenantID": FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                "roomNumber":
                                                    _roomNumberController.text
                                                        .trim(),
                                              },
                                            ).whenComplete(
                                              () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const JoinedSuccessfully()));
                                              },
                                            );
                                          } else {
                                            joinHouseCodeController
                                                .setHasError(false);
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            abangColors.abangYellow,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              5 / mockUpWidth * size.width),
                                        ),
                                      ),
                                      child: Container(
                                        width: 355 / mockUpWidth * size.width,
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              20 / mockUpHeight * size.height,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "SUBMIT AND JOIN",
                                            textScaleFactor: textScale,
                                            style: abangTextStyles
                                                .buttonTextStyle
                                                .copyWith(
                                              color: abangColors.abangPrimary,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
