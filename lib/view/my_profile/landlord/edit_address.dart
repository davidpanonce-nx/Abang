import 'package:abang/components/loading.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/controllers/edit_profile_controller.dart';
import 'package:abang/models/models.dart';
import 'package:abang/services/firestore_db.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({Key? key, required this.userData}) : super(key: key);

  final AbangUser userData;
  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> with FirestoreDataServices {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    EditProfileController editProfileController = EditProfileController();

    editProfileController.initRegion(widget.userData.region);
    if (widget.userData.region == "National Capital Region (NCR") {
      editProfileController.getInitNCRcities(widget.userData.region);
      editProfileController.initCity(widget.userData.city);
      editProfileController.getInitNCRbarangays(
          widget.userData.region, widget.userData.city);
      editProfileController.initBarangay(widget.userData.barangay);
    } else {
      editProfileController.getInitProvinces(widget.userData.region);
      editProfileController.initProvice(widget.userData.province);
      editProfileController.getInitCities(widget.userData.province!);
      editProfileController.initCity(widget.userData.city);
      editProfileController.getInitBarangays(widget.userData.city);
      editProfileController.initBarangay(widget.userData.barangay);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final editProfileController = Provider.of<EditProfileController>(context);
    return editProfileController.isLoading
        ? const AbangLoading(text: "Saving Address")
        : Scaffold(
            backgroundColor: abangColors.abangPrimary,
            body: Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.symmetric(
                vertical: 50 / mockUpHeight * size.height,
                horizontal: 20 / mockUpWidth * size.width,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
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
                            onTap: () async {
                              if (editProfileController.region !=
                                      widget.userData.region ||
                                  editProfileController.province !=
                                      widget.userData.province ||
                                  editProfileController.city !=
                                      widget.userData.city ||
                                  editProfileController.barangay !=
                                      widget.userData.barangay) {
                                if (_formKey.currentState!.validate()) {
                                  editProfileController.setIsLoading(true);
                                  AbangUser user = AbangUser(
                                    userID: widget.userData.userID,
                                    role: widget.userData.role,
                                    dateCreated: widget.userData.dateCreated,
                                    avatarURL: widget.userData.avatarURL,
                                    userInfoID: widget.userData.userInfoID,
                                    firstName: widget.userData.firstName,
                                    middleName: widget.userData.middleName,
                                    lastName: widget.userData.lastName,
                                    contactNumber:
                                        widget.userData.contactNumber,
                                    signatureURL: widget.userData.signatureURL,
                                    email: widget.userData.email,
                                    locationID: widget.userData.locationID,
                                    region: editProfileController.region!,
                                    province: editProfileController.province,
                                    city: editProfileController.city!,
                                    barangay: editProfileController.barangay!,
                                  );
                                  await uploadUserDataToDB(user.toMap())
                                      .whenComplete(() {
                                    editProfileController.setIsLoading(false);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  });
                                }
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              "Save",
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
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/edit_address.svg'),
                      SizedBox(
                        height: 35 / mockUpHeight * size.height,
                      ),
                      Text(
                        'Edit Your Address',
                        textScaleFactor: textScale,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: 0.15,
                            color: abangColors.abangWhite,
                          ),
                        ),
                      ),
                      SizedBox(height: 20 / mockUpHeight * size.height),
                      DropdownButtonFormField2(
                        isExpanded: true,
                        // itemHeight: 60 / mockUpHeight * size.height,
                        // dropdownMaxHeight: 200 / mockUpHeight * size.height,
                        // offset: Offset(0, 10.0 / mockUpHeight * size.height),
                        // focusColor: abangColors.abangWhite,
                        validator: (val) {
                          if (val == null) {
                            return "Region can't be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Select Region",
                          hintStyle: abangTextStyles.smallTextStyle.copyWith(
                            color: abangColors.abangWhite.withOpacity(0.50),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                5 / mockUpWidth * size.width),
                            borderSide: BorderSide(
                              color: abangColors.abangWhite,
                              width: 2.0 / mockUpWidth * size.width,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                5 / mockUpWidth * size.width),
                            borderSide: BorderSide(
                              color: abangColors.abangWhite,
                              width: 2.0 / mockUpWidth * size.width,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                5 / mockUpWidth * size.width),
                            borderSide: BorderSide(
                              color: abangColors.abangSecondary,
                              width: 2.0 / mockUpWidth * size.width,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                5 / mockUpWidth * size.width),
                            borderSide: BorderSide(
                              color: abangColors.abangSecondary,
                              width: 2.0 / mockUpWidth * size.width,
                            ),
                          ),
                        ),
                        // dropdownDecoration: BoxDecoration(
                        //   color: abangColors.abangYellow,
                        //   borderRadius: BorderRadius.circular(
                        //     5 / mockUpWidth * size.width,
                        //   ),
                        // ),
                        items: editProfileController.regions.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              textScaleFactor: textScale,
                              maxLines: 2,
                              style: abangTextStyles.smallTextStyle
                                  .copyWith(color: abangColors.abangWhite),
                            ),
                          );
                        }).toList(),
                        onChanged: (val) {
                          editProfileController.setRegion(val.toString());
                          editProfileController.setProvice(null);
                          editProfileController.setCity(null);
                          editProfileController.setBarangay(null);
                          editProfileController.clearProvinceData();
                          editProfileController.clearCityData();
                          editProfileController.clearBarangayData();
                          if (val.toString() ==
                              "National Capital Region (NCR)") {
                            editProfileController
                                .getNCRcities(editProfileController.region!);
                          } else {
                            editProfileController
                                .getProvinces(editProfileController.region!);
                          }
                        },
                        value: editProfileController.region,
                      ),
                      editProfileController.region ==
                              "National Capital Region (NCR)"
                          ? Container(
                              margin: EdgeInsets.only(
                                top: 8 / mockUpHeight * size.height,
                              ),
                              child: DropdownButtonFormField2(
                                isExpanded: true,
                                // itemHeight: 60 / mockUpHeight * size.height,
                                // dropdownMaxHeight:
                                //     200 / mockUpHeight * size.height,
                                // offset: Offset(
                                //     0, 10.0 / mockUpHeight * size.height),
                                // focusColor: abangColors.abangWhite,
                                validator: (val) {
                                  if (val == null) {
                                    return "City can't be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Select City",
                                  hintStyle:
                                      abangTextStyles.smallTextStyle.copyWith(
                                    color: abangColors.abangWhite
                                        .withOpacity(0.50),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangWhite,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangWhite,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangSecondary,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangSecondary,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                ),
                                // dropdownDecoration: BoxDecoration(
                                //   color: abangColors.abangYellow,
                                //   borderRadius: BorderRadius.circular(
                                //     5 / mockUpWidth * size.width,
                                //   ),
                                // ),
                                items: editProfileController.cities.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      textScaleFactor: textScale,
                                      maxLines: 2,
                                      style: abangTextStyles.smallTextStyle
                                          .copyWith(
                                              color: abangColors.abangWhite),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  editProfileController.setCity(val.toString());
                                  editProfileController.setBarangay(null);

                                  editProfileController.clearBarangayData();
                                  editProfileController.getNCRbarangays(
                                      editProfileController.region!,
                                      editProfileController.city!);
                                },
                                value: editProfileController.city,
                              ),
                            )
                          : editProfileController.region != null
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: 8 / mockUpHeight * size.height,
                                  ),
                                  child: DropdownButtonFormField2(
                                    isExpanded: true,
                                    // itemHeight: 60 / mockUpHeight * size.height,
                                    // dropdownMaxHeight:
                                    //     200 / mockUpHeight * size.height,
                                    // offset: Offset(
                                    //     0, 10.0 / mockUpHeight * size.height),
                                    // focusColor: abangColors.abangWhite,
                                    validator: (val) {
                                      if (val == null) {
                                        return "Province can't be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Select Province",
                                      hintStyle: abangTextStyles.smallTextStyle
                                          .copyWith(
                                        color: abangColors.abangWhite
                                            .withOpacity(0.50),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: BorderSide(
                                          color: abangColors.abangWhite,
                                          width: 2.0 / mockUpWidth * size.width,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: BorderSide(
                                          color: abangColors.abangWhite,
                                          width: 2.0 / mockUpWidth * size.width,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: BorderSide(
                                          color: abangColors.abangSecondary,
                                          width: 2.0 / mockUpWidth * size.width,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: BorderSide(
                                          color: abangColors.abangSecondary,
                                          width: 2.0 / mockUpWidth * size.width,
                                        ),
                                      ),
                                    ),
                                    // dropdownDecoration: BoxDecoration(
                                    //   color: abangColors.abangYellow,
                                    //   borderRadius: BorderRadius.circular(
                                    //     5 / mockUpWidth * size.width,
                                    //   ),
                                    // ),
                                    items: editProfileController.provinces
                                        .map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                          textScaleFactor: textScale,
                                          maxLines: 2,
                                          style: abangTextStyles.smallTextStyle
                                              .copyWith(
                                                  color:
                                                      abangColors.abangWhite),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      editProfileController
                                          .setProvice(val.toString());
                                      editProfileController.setCity(null);
                                      editProfileController.setBarangay(null);

                                      editProfileController.clearCityData();
                                      editProfileController.clearBarangayData();
                                      editProfileController.getCities(
                                          editProfileController.province!);
                                    },
                                    value: editProfileController.province,
                                  ),
                                )
                              : const SizedBox(),
                      editProfileController.province != null
                          ? Container(
                              margin: EdgeInsets.only(
                                top: 8 / mockUpHeight * size.height,
                              ),
                              child: DropdownButtonFormField2(
                                isExpanded: true,
                                // itemHeight: 60 / mockUpHeight * size.height,
                                // dropdownMaxHeight:
                                //     200 / mockUpHeight * size.height,
                                // offset: Offset(
                                //     0, 10.0 / mockUpHeight * size.height),
                                // focusColor: abangColors.abangWhite,
                                validator: (val) {
                                  if (val == null) {
                                    return "City can't be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Select City",
                                  hintStyle:
                                      abangTextStyles.smallTextStyle.copyWith(
                                    color: abangColors.abangWhite
                                        .withOpacity(0.50),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangWhite,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangWhite,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangSecondary,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangSecondary,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                ),
                                // dropdownDecoration: BoxDecoration(
                                //   color: abangColors.abangYellow,
                                //   borderRadius: BorderRadius.circular(
                                //     5 / mockUpWidth * size.width,
                                //   ),
                                // ),
                                items: editProfileController.cities.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      textScaleFactor: textScale,
                                      maxLines: 2,
                                      style: abangTextStyles.smallTextStyle
                                          .copyWith(
                                              color: abangColors.abangWhite),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  editProfileController.setCity(val.toString());
                                  editProfileController.setBarangay(null);

                                  editProfileController.clearBarangayData();
                                  editProfileController.getBarangays(
                                      editProfileController.city!);
                                },
                                value: editProfileController.city,
                              ),
                            )
                          : const SizedBox(),
                      editProfileController.city != null
                          ? Container(
                              margin: EdgeInsets.only(
                                top: 8 / mockUpHeight * size.height,
                              ),
                              child: DropdownButtonFormField2(
                                isExpanded: true,
                                // itemHeight: 60 / mockUpHeight * size.height,
                                // dropdownMaxHeight:
                                //     200 / mockUpHeight * size.height,
                                // offset: Offset(
                                //     0, 10.0 / mockUpHeight * size.height),
                                // focusColor: abangColors.abangWhite,
                                validator: (val) {
                                  if (val == null) {
                                    return "Barangay can't be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Select Barangay",
                                  hintStyle:
                                      abangTextStyles.smallTextStyle.copyWith(
                                    color: abangColors.abangWhite
                                        .withOpacity(0.50),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangWhite,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangWhite,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangSecondary,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                    borderSide: BorderSide(
                                      color: abangColors.abangSecondary,
                                      width: 2.0 / mockUpWidth * size.width,
                                    ),
                                  ),
                                ),
                                // dropdownDecoration: BoxDecoration(
                                //   color: abangColors.abangYellow,
                                //   borderRadius: BorderRadius.circular(
                                //     5 / mockUpWidth * size.width,
                                //   ),
                                // ),
                                items: editProfileController.barangays.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      textScaleFactor: textScale,
                                      maxLines: 2,
                                      style: abangTextStyles.smallTextStyle
                                          .copyWith(
                                              color: abangColors.abangWhite),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  editProfileController
                                      .setBarangay(val.toString());
                                },
                                value: editProfileController.barangay,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
