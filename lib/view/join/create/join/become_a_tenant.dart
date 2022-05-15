import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/constants.dart';

class BecomeATenant extends StatefulWidget {
  const BecomeATenant({Key? key}) : super(key: key);

  @override
  State<BecomeATenant> createState() => _BecomeATenantState();
}

class _BecomeATenantState extends State<BecomeATenant> {
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
    return Scaffold(
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
                            topLeft:
                                Radius.circular(50 / mockUpWidth * size.width),
                            topRight:
                                Radius.circular(50 / mockUpWidth * size.width),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 30 / mockUpHeight * size.height,
                                ),
                                Text(
                                  "Become a Tenant",
                                  textScaleFactor: textScale,
                                  style:
                                      abangTextStyles.titleTextStyle.copyWith(
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
                                      horizontal:
                                          11.5 / mockUpWidth * size.width),
                                  child: TextFormField(
                                    cursorColor: abangColors.abangPrimary,
                                    cursorHeight:
                                        20 / mockUpHeight * size.height,
                                    controller: _houseCodeController,
                                    style: abangTextStyles.smallTextStyle
                                        .copyWith(
                                            color: abangColors.abangWhite),
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
                                      hintStyle: abangTextStyles.smallTextStyle
                                          .copyWith(
                                        color: abangColors.abangPrimary
                                            .withOpacity(0.50),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: const BorderSide(
                                          width: 0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: const BorderSide(
                                          width: 0,
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
                                ),
                                SizedBox(
                                  height: 8 / mockUpHeight * size.height,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          11.5 / mockUpWidth * size.width),
                                  child: TextFormField(
                                    cursorColor: abangColors.abangPrimary,
                                    cursorHeight:
                                        20 / mockUpHeight * size.height,
                                    controller: _roomNumberController,
                                    style: abangTextStyles.smallTextStyle
                                        .copyWith(
                                            color: abangColors.abangWhite),
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
                                      hintStyle: abangTextStyles.smallTextStyle
                                          .copyWith(
                                        color: abangColors.abangPrimary
                                            .withOpacity(0.50),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: const BorderSide(
                                          width: 0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: const BorderSide(
                                          width: 0,
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
                                ),
                                SizedBox(
                                  height: 8 / mockUpHeight * size.height,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          11.5 / mockUpWidth * size.width),
                                  child: TextFormField(
                                    cursorColor: abangColors.abangPrimary,
                                    cursorHeight:
                                        20 / mockUpHeight * size.height,
                                    controller: _dateController,
                                    style: abangTextStyles.smallTextStyle
                                        .copyWith(
                                            color: abangColors.abangWhite),
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
                                        onPressed: () {},
                                        color: abangColors.abangPrimary,
                                        iconSize: 24 / mockUpWidth * size.width,
                                        icon: const Icon(
                                          Icons.calendar_today,
                                        ),
                                      ),
                                      hintText: "Billing Date",
                                      hintStyle: abangTextStyles.smallTextStyle
                                          .copyWith(
                                        color: abangColors.abangPrimary
                                            .withOpacity(0.50),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: const BorderSide(
                                          width: 0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5 / mockUpWidth * size.width),
                                        borderSide: const BorderSide(
                                          width: 0,
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
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12 / mockUpWidth * size.width,
                                vertical: 50 / mockUpHeight * size.height,
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: abangColors.abangYellow,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width),
                                  ),
                                ),
                                child: Container(
                                  width: 355 / mockUpWidth * size.width,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20 / mockUpHeight * size.height,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "SUBMIT AND JOIN",
                                      textScaleFactor: textScale,
                                      style: abangTextStyles.buttonTextStyle
                                          .copyWith(
                                        color: abangColors.abangPrimary,
                                        fontWeight: FontWeight.w500,
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
