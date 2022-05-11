import 'package:abang/controllers/sign_up_page_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';
import '../../../components/themes.dart';

class SignUpPage2 extends StatefulWidget {
  const SignUpPage2({
    Key? key,
    required this.contactNumberController,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController contactNumberController;
  final GlobalKey<FormState> formKey;
  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _fadeController;
  late final Animation<double> _fadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ),
  );

  late final Animation<double> _scale = Tween<double>(
    begin: 0.95,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0,
        1,
        curve: Curves.easeOut,
      ),
    ),
  );
  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final signUpPageController = Provider.of<SignUpPageController>(context);
    return FadeTransition(
      opacity: _fadeAnimation,
      child: AnimatedBuilder(
        animation: _animationController..forward(),
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _scale.value,
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: 12 / mockUpWidth * size.width),
              child: Form(
                key: widget.formKey,
                child: Column(
                  children: [
                    Text(
                      "Contact Information",
                      textAlign: TextAlign.center,
                      textScaleFactor: textScale,
                      style: abangTextStyles.titleTextStyle.copyWith(
                          color: abangColors.abangWhite, letterSpacing: 0.15),
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * size.height,
                    ),
                    TextFormField(
                      cursorColor: abangColors.abangWhite,
                      cursorHeight: 20 / mockUpHeight * size.height,
                      controller: widget.contactNumberController,
                      style: abangTextStyles.smallTextStyle
                          .copyWith(color: abangColors.abangWhite),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter your contact number";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.fromLTRB(
                          20 / mockUpWidth * size.width,
                          20 / mockUpHeight * size.height,
                          20 / mockUpWidth * size.width,
                          20 / mockUpHeight * size.height,
                        ),
                        hintText: "Contact Number",
                        hintStyle: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangWhite.withOpacity(0.50),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangYellow,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangYellow,
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
                    ),
                    SizedBox(
                      height: 8 / mockUpHeight * size.height,
                    ),
                    DropdownButtonFormField2(
                      isExpanded: true,
                      itemHeight: 60 / mockUpHeight * size.height,
                      dropdownMaxHeight: 200 / mockUpHeight * size.height,
                      offset: Offset(0, 10.0 / mockUpHeight * size.height),
                      focusColor: abangColors.abangYellow,
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
                            color: abangColors.abangYellow,
                            width: 2.0 / mockUpWidth * size.width,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                          borderSide: BorderSide(
                            color: abangColors.abangYellow,
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
                      dropdownDecoration: BoxDecoration(
                        color: abangColors.abangYellow,
                        borderRadius: BorderRadius.circular(
                          5 / mockUpWidth * size.width,
                        ),
                      ),
                      items: signUpPageController.regions.map((e) {
                        return DropdownMenuItem(
                          child: Text(
                            e,
                            textScaleFactor: textScale,
                            maxLines: 2,
                            style: abangTextStyles.smallTextStyle
                                .copyWith(color: abangColors.abangWhite),
                          ),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (val) {
                        signUpPageController.setRegion(val.toString());
                        signUpPageController.setProvice(null);
                        signUpPageController.setCity(null);
                        signUpPageController.setBarangay(null);
                        signUpPageController.clearProvinceData();
                        signUpPageController.clearCityData();
                        signUpPageController.clearBarangayData();
                        if (val.toString() == "National Capital Region (NCR)") {
                          signUpPageController
                              .getNCRcities(signUpPageController.region!);
                        } else {
                          signUpPageController
                              .getProvinces(signUpPageController.region!);
                        }
                      },
                      value: signUpPageController.region,
                    ),
                    signUpPageController.region ==
                            "National Capital Region (NCR)"
                        ? Container(
                            margin: EdgeInsets.only(
                              top: 8 / mockUpHeight * size.height,
                            ),
                            child: DropdownButtonFormField2(
                              isExpanded: true,
                              itemHeight: 60 / mockUpHeight * size.height,
                              dropdownMaxHeight:
                                  200 / mockUpHeight * size.height,
                              offset:
                                  Offset(0, 10.0 / mockUpHeight * size.height),
                              focusColor: abangColors.abangYellow,
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
                                  color:
                                      abangColors.abangWhite.withOpacity(0.50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      5 / mockUpWidth * size.width),
                                  borderSide: BorderSide(
                                    color: abangColors.abangYellow,
                                    width: 2.0 / mockUpWidth * size.width,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      5 / mockUpWidth * size.width),
                                  borderSide: BorderSide(
                                    color: abangColors.abangYellow,
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
                              dropdownDecoration: BoxDecoration(
                                color: abangColors.abangYellow,
                                borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width,
                                ),
                              ),
                              items: signUpPageController.cities.map((e) {
                                return DropdownMenuItem(
                                  child: Text(
                                    e,
                                    textScaleFactor: textScale,
                                    maxLines: 2,
                                    style: abangTextStyles.smallTextStyle
                                        .copyWith(
                                            color: abangColors.abangWhite),
                                  ),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (val) {
                                signUpPageController.setCity(val.toString());
                                signUpPageController.setBarangay(null);

                                signUpPageController.clearBarangayData();
                                signUpPageController.getNCRbarangays(
                                    signUpPageController.region!,
                                    signUpPageController.city!);
                              },
                              value: signUpPageController.city,
                            ),
                          )
                        : signUpPageController.region != null
                            ? Container(
                                margin: EdgeInsets.only(
                                  top: 8 / mockUpHeight * size.height,
                                ),
                                child: DropdownButtonFormField2(
                                  isExpanded: true,
                                  itemHeight: 60 / mockUpHeight * size.height,
                                  dropdownMaxHeight:
                                      200 / mockUpHeight * size.height,
                                  offset: Offset(
                                      0, 10.0 / mockUpHeight * size.height),
                                  focusColor: abangColors.abangYellow,
                                  validator: (val) {
                                    if (val == null) {
                                      return "Province can't be empty";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Select Province",
                                    hintStyle:
                                        abangTextStyles.smallTextStyle.copyWith(
                                      color: abangColors.abangWhite
                                          .withOpacity(0.50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5 / mockUpWidth * size.width),
                                      borderSide: BorderSide(
                                        color: abangColors.abangYellow,
                                        width: 2.0 / mockUpWidth * size.width,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5 / mockUpWidth * size.width),
                                      borderSide: BorderSide(
                                        color: abangColors.abangYellow,
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
                                  dropdownDecoration: BoxDecoration(
                                    color: abangColors.abangYellow,
                                    borderRadius: BorderRadius.circular(
                                      5 / mockUpWidth * size.width,
                                    ),
                                  ),
                                  items:
                                      signUpPageController.provinces.map((e) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        e,
                                        textScaleFactor: textScale,
                                        maxLines: 2,
                                        style: abangTextStyles.smallTextStyle
                                            .copyWith(
                                                color: abangColors.abangWhite),
                                      ),
                                      value: e,
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    signUpPageController
                                        .setProvice(val.toString());
                                    signUpPageController.setCity(null);
                                    signUpPageController.setBarangay(null);

                                    signUpPageController.clearCityData();
                                    signUpPageController.clearBarangayData();
                                    signUpPageController.getCities(
                                        signUpPageController.province!);
                                  },
                                  value: signUpPageController.province,
                                ),
                              )
                            : const SizedBox(),
                    signUpPageController.province != null
                        ? Container(
                            margin: EdgeInsets.only(
                              top: 8 / mockUpHeight * size.height,
                            ),
                            child: DropdownButtonFormField2(
                              isExpanded: true,
                              itemHeight: 60 / mockUpHeight * size.height,
                              dropdownMaxHeight:
                                  200 / mockUpHeight * size.height,
                              offset:
                                  Offset(0, 10.0 / mockUpHeight * size.height),
                              focusColor: abangColors.abangYellow,
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
                                  color:
                                      abangColors.abangWhite.withOpacity(0.50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      5 / mockUpWidth * size.width),
                                  borderSide: BorderSide(
                                    color: abangColors.abangYellow,
                                    width: 2.0 / mockUpWidth * size.width,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      5 / mockUpWidth * size.width),
                                  borderSide: BorderSide(
                                    color: abangColors.abangYellow,
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
                              dropdownDecoration: BoxDecoration(
                                color: abangColors.abangYellow,
                                borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width,
                                ),
                              ),
                              items: signUpPageController.cities.map((e) {
                                return DropdownMenuItem(
                                  child: Text(
                                    e,
                                    textScaleFactor: textScale,
                                    maxLines: 2,
                                    style: abangTextStyles.smallTextStyle
                                        .copyWith(
                                            color: abangColors.abangWhite),
                                  ),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (val) {
                                signUpPageController.setCity(val.toString());
                                signUpPageController.setBarangay(null);

                                signUpPageController.clearBarangayData();
                                signUpPageController
                                    .getBarangays(signUpPageController.city!);
                              },
                              value: signUpPageController.city,
                            ),
                          )
                        : const SizedBox(),
                    signUpPageController.city != null
                        ? Container(
                            margin: EdgeInsets.only(
                              top: 8 / mockUpHeight * size.height,
                            ),
                            child: DropdownButtonFormField2(
                              isExpanded: true,
                              itemHeight: 60 / mockUpHeight * size.height,
                              dropdownMaxHeight:
                                  200 / mockUpHeight * size.height,
                              offset:
                                  Offset(0, 10.0 / mockUpHeight * size.height),
                              focusColor: abangColors.abangYellow,
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
                                  color:
                                      abangColors.abangWhite.withOpacity(0.50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      5 / mockUpWidth * size.width),
                                  borderSide: BorderSide(
                                    color: abangColors.abangYellow,
                                    width: 2.0 / mockUpWidth * size.width,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      5 / mockUpWidth * size.width),
                                  borderSide: BorderSide(
                                    color: abangColors.abangYellow,
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
                              dropdownDecoration: BoxDecoration(
                                color: abangColors.abangYellow,
                                borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width,
                                ),
                              ),
                              items: signUpPageController.barangays.map((e) {
                                return DropdownMenuItem(
                                  child: Text(
                                    e,
                                    textScaleFactor: textScale,
                                    maxLines: 2,
                                    style: abangTextStyles.smallTextStyle
                                        .copyWith(
                                            color: abangColors.abangWhite),
                                  ),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (val) {
                                signUpPageController
                                    .setBarangay(val.toString());
                              },
                              value: signUpPageController.barangay,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
