import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/constants.dart';
import '../../../../components/themes.dart';
import '../../../../controllers/create_house_code_controller.dart';

class CreateHouseCodeAdress extends StatefulWidget {
  const CreateHouseCodeAdress({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  @override
  State<CreateHouseCodeAdress> createState() => _CreateHouseCodeAdressState();
}

class _CreateHouseCodeAdressState extends State<CreateHouseCodeAdress> {
  @override
  Widget build(BuildContext context) {
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(
            height: 30 / mockUpHeight * size.height,
          ),
          Text(
            "Address",
            textScaleFactor: textScale,
            style: abangTextStyles.titleTextStyle.copyWith(
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
                horizontal: 11.5 / mockUpWidth * size.width),
            child: DropdownButtonFormField2(
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
                contentPadding: EdgeInsets.fromLTRB(
                  20 / mockUpWidth * size.width,
                  20 / mockUpHeight * size.height,
                  20 / mockUpWidth * size.width,
                  20 / mockUpHeight * size.height,
                ),
                hintText: "Select Region",
                hintStyle: abangTextStyles.smallTextStyle.copyWith(
                  color: abangColors.abangPrimary.withOpacity(0.50),
                ),
                errorStyle: abangTextStyles.smallTextStyle
                    .copyWith(color: abangColors.abangYellow, fontSize: 12),
                filled: true,
                fillColor: abangColors.abangWhite,
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(5 / mockUpWidth * size.width),
                  borderSide: const BorderSide(
                    width: 0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(5 / mockUpWidth * size.width),
                  borderSide: const BorderSide(
                    width: 0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(5 / mockUpWidth * size.width),
                  borderSide: BorderSide(
                    color: abangColors.abangYellow,
                    width: 2.0 / mockUpWidth * size.width,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(5 / mockUpWidth * size.width),
                  borderSide: BorderSide(
                    color: abangColors.abangYellow,
                    width: 2.0 / mockUpWidth * size.width,
                  ),
                ),
              ),
              dropdownDecoration: BoxDecoration(
                color: abangColors.abangWhite,
                borderRadius: BorderRadius.circular(
                  5 / mockUpWidth * size.width,
                ),
              ),
              items: createHouseCodeController.regions.map((e) {
                return DropdownMenuItem(
                  child: Text(
                    e,
                    textScaleFactor: textScale,
                    maxLines: 2,
                    style: abangTextStyles.smallTextStyle
                        .copyWith(color: abangColors.abangPrimary),
                  ),
                  value: e,
                );
              }).toList(),
              onChanged: (val) {
                createHouseCodeController.setRegion(val.toString());
                createHouseCodeController.setProvice(null);
                createHouseCodeController.setCity(null);
                createHouseCodeController.setBarangay(null);
                createHouseCodeController.clearProvinceData();
                createHouseCodeController.clearCityData();
                createHouseCodeController.clearBarangayData();
                if (val.toString() == "National Capital Region (NCR)") {
                  createHouseCodeController
                      .getNCRcities(createHouseCodeController.region!);
                } else {
                  createHouseCodeController
                      .getProvinces(createHouseCodeController.region!);
                }
              },
              value: createHouseCodeController.region,
            ),
          ),
          SizedBox(
            height: 8 / mockUpHeight * size.height,
          ),
          createHouseCodeController.region == "National Capital Region (NCR)"
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: 8 / mockUpHeight * size.height,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 11.5 / mockUpWidth * size.width),
                  child: DropdownButtonFormField2(
                    isExpanded: true,
                    itemHeight: 60 / mockUpHeight * size.height,
                    dropdownMaxHeight: 200 / mockUpHeight * size.height,
                    offset: Offset(0, 10.0 / mockUpHeight * size.height),
                    focusColor: abangColors.abangYellow,
                    validator: (val) {
                      if (val == null) {
                        return "City can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                      ),
                      hintText: "Select City",
                      hintStyle: abangTextStyles.smallTextStyle.copyWith(
                        color: abangColors.abangPrimary.withOpacity(0.50),
                      ),
                      errorStyle: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangYellow, fontSize: 12),
                      filled: true,
                      fillColor: abangColors.abangWhite,
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: const BorderSide(
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: const BorderSide(
                          width: 0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                    ),
                    dropdownDecoration: BoxDecoration(
                      color: abangColors.abangWhite,
                      borderRadius: BorderRadius.circular(
                        5 / mockUpWidth * size.width,
                      ),
                    ),
                    items: createHouseCodeController.cities.map((e) {
                      return DropdownMenuItem(
                        child: Text(
                          e,
                          textScaleFactor: textScale,
                          maxLines: 2,
                          style: abangTextStyles.smallTextStyle
                              .copyWith(color: abangColors.abangPrimary),
                        ),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (val) {
                      createHouseCodeController.setCity(val.toString());
                      createHouseCodeController.setBarangay(null);

                      createHouseCodeController.clearBarangayData();
                      createHouseCodeController.getNCRbarangays(
                          createHouseCodeController.region!,
                          createHouseCodeController.city!);
                    },
                    value: createHouseCodeController.city,
                  ),
                )
              : createHouseCodeController.region != null
                  ? Container(
                      margin: EdgeInsets.only(
                        bottom: 8 / mockUpHeight * size.height,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.5 / mockUpWidth * size.width),
                      child: DropdownButtonFormField2(
                        isExpanded: true,
                        itemHeight: 60 / mockUpHeight * size.height,
                        dropdownMaxHeight: 200 / mockUpHeight * size.height,
                        offset: Offset(0, 10.0 / mockUpHeight * size.height),
                        focusColor: abangColors.abangYellow,
                        validator: (val) {
                          if (val == null) {
                            return "Province can't be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                            20 / mockUpWidth * size.width,
                            20 / mockUpHeight * size.height,
                            20 / mockUpWidth * size.width,
                            20 / mockUpHeight * size.height,
                          ),
                          hintText: "Select Province",
                          hintStyle: abangTextStyles.smallTextStyle.copyWith(
                            color: abangColors.abangPrimary.withOpacity(0.50),
                          ),
                          errorStyle: abangTextStyles.smallTextStyle.copyWith(
                              color: abangColors.abangYellow, fontSize: 12),
                          filled: true,
                          fillColor: abangColors.abangWhite,
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
                              color: abangColors.abangYellow,
                              width: 2.0 / mockUpWidth * size.width,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                5 / mockUpWidth * size.width),
                            borderSide: BorderSide(
                              color: abangColors.abangYellow,
                              width: 2.0 / mockUpWidth * size.width,
                            ),
                          ),
                        ),
                        dropdownDecoration: BoxDecoration(
                          color: abangColors.abangWhite,
                          borderRadius: BorderRadius.circular(
                            5 / mockUpWidth * size.width,
                          ),
                        ),
                        items: createHouseCodeController.provinces.map((e) {
                          return DropdownMenuItem(
                            child: Text(
                              e,
                              textScaleFactor: textScale,
                              maxLines: 2,
                              style: abangTextStyles.smallTextStyle
                                  .copyWith(color: abangColors.abangPrimary),
                            ),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          createHouseCodeController.setProvice(val.toString());
                          createHouseCodeController.setCity(null);
                          createHouseCodeController.setBarangay(null);

                          createHouseCodeController.clearCityData();
                          createHouseCodeController.clearBarangayData();
                          createHouseCodeController
                              .getCities(createHouseCodeController.province!);
                        },
                        value: createHouseCodeController.province,
                      ),
                    )
                  : const SizedBox(),
          createHouseCodeController.province != null
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: 8 / mockUpHeight * size.height,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 11.5 / mockUpWidth * size.width),
                  child: DropdownButtonFormField2(
                    isExpanded: true,
                    itemHeight: 60 / mockUpHeight * size.height,
                    dropdownMaxHeight: 200 / mockUpHeight * size.height,
                    offset: Offset(0, 10.0 / mockUpHeight * size.height),
                    focusColor: abangColors.abangYellow,
                    validator: (val) {
                      if (val == null) {
                        return "City can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                      ),
                      hintText: "Select City",
                      hintStyle: abangTextStyles.smallTextStyle.copyWith(
                        color: abangColors.abangPrimary.withOpacity(0.50),
                      ),
                      errorStyle: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangYellow, fontSize: 12),
                      filled: true,
                      fillColor: abangColors.abangWhite,
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: const BorderSide(
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: const BorderSide(
                          width: 0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                    ),
                    dropdownDecoration: BoxDecoration(
                      color: abangColors.abangWhite,
                      borderRadius: BorderRadius.circular(
                        5 / mockUpWidth * size.width,
                      ),
                    ),
                    items: createHouseCodeController.cities.map((e) {
                      return DropdownMenuItem(
                        child: Text(
                          e,
                          textScaleFactor: textScale,
                          maxLines: 2,
                          style: abangTextStyles.smallTextStyle
                              .copyWith(color: abangColors.abangPrimary),
                        ),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (val) {
                      createHouseCodeController.setCity(val.toString());
                      createHouseCodeController.setBarangay(null);

                      createHouseCodeController.clearBarangayData();
                      createHouseCodeController
                          .getBarangays(createHouseCodeController.city!);
                    },
                    value: createHouseCodeController.city,
                  ),
                )
              : const SizedBox(),
          createHouseCodeController.city != null
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: 8 / mockUpHeight * size.height,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 11.5 / mockUpWidth * size.width),
                  child: DropdownButtonFormField2(
                    isExpanded: true,
                    itemHeight: 60 / mockUpHeight * size.height,
                    dropdownMaxHeight: 200 / mockUpHeight * size.height,
                    offset: Offset(0, 10.0 / mockUpHeight * size.height),
                    focusColor: abangColors.abangYellow,
                    validator: (val) {
                      if (val == null) {
                        return "Barangay can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                      ),
                      hintText: "Select Barangay",
                      hintStyle: abangTextStyles.smallTextStyle.copyWith(
                        color: abangColors.abangPrimary.withOpacity(0.50),
                      ),
                      errorStyle: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangYellow, fontSize: 12),
                      filled: true,
                      fillColor: abangColors.abangWhite,
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: const BorderSide(
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: const BorderSide(
                          width: 0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                    ),
                    dropdownDecoration: BoxDecoration(
                      color: abangColors.abangWhite,
                      borderRadius: BorderRadius.circular(
                        5 / mockUpWidth * size.width,
                      ),
                    ),
                    items: createHouseCodeController.barangays.map((e) {
                      return DropdownMenuItem(
                        child: Text(
                          e,
                          textScaleFactor: textScale,
                          maxLines: 2,
                          style: abangTextStyles.smallTextStyle
                              .copyWith(color: abangColors.abangPrimary),
                        ),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (val) {
                      createHouseCodeController.setBarangay(val.toString());
                    },
                    value: createHouseCodeController.barangay,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
