import 'package:abang/components/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/themes.dart';
import '../../../../controllers/create_house_code_controller.dart';

class CreateHouseCodeDetails extends StatefulWidget {
  const CreateHouseCodeDetails({
    Key? key,
    required this.establishmentNameController,
    required this.numberOfRoomsController,
    required this.avgRoomCapacityController,
  }) : super(key: key);

  final TextEditingController establishmentNameController;
  final TextEditingController numberOfRoomsController;
  final TextEditingController avgRoomCapacityController;

  @override
  State<CreateHouseCodeDetails> createState() => _CreateHouseCodeDetailsState();
}

class _CreateHouseCodeDetailsState extends State<CreateHouseCodeDetails> {
  @override
  Widget build(BuildContext context) {
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Column(
      children: [
        SizedBox(
          height: 30 / mockUpHeight * size.height,
        ),
        Text(
          "Details",
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
          padding:
              EdgeInsets.symmetric(horizontal: 11.5 / mockUpWidth * size.width),
          child: DropdownButtonFormField2(
            isExpanded: true,
            itemHeight: 60 / mockUpHeight * size.height,
            dropdownMaxHeight: 200 / mockUpHeight * size.height,
            offset: Offset(0, 10.0 / mockUpHeight * size.height),
            focusColor: abangColors.abangYellow,
            validator: (val) {
              if (val == null) {
                return "Establishment type can't be empty";
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
              hintText: "Establishment Type",
              hintStyle: abangTextStyles.smallTextStyle.copyWith(
                color: abangColors.abangPrimary.withOpacity(0.50),
              ),
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
            items: createHouseCodeController.establishmentType.map((e) {
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
              createHouseCodeController
                  .setSelectedEstablishment(val.toString());
            },
            value: createHouseCodeController.selectedEstablishment,
          ),
        ),
        SizedBox(
          height: 8 / mockUpHeight * size.height,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 11.5 / mockUpWidth * size.width),
          child: TextFormField(
            cursorColor: abangColors.abangPrimary,
            cursorHeight: 20 / mockUpHeight * size.height,
            controller: widget.establishmentNameController,
            style: abangTextStyles.smallTextStyle
                .copyWith(color: abangColors.abangWhite),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Please an establishment name.";
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
              hintText: "Establishment Name",
              hintStyle: abangTextStyles.smallTextStyle.copyWith(
                color: abangColors.abangPrimary.withOpacity(0.50),
              ),
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
                  color: abangColors.abangSecondary,
                  width: 2.0 / mockUpWidth * size.width,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(5 / mockUpWidth * size.width),
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
          padding:
              EdgeInsets.symmetric(horizontal: 11.5 / mockUpWidth * size.width),
          child: TextFormField(
            cursorColor: abangColors.abangPrimary,
            cursorHeight: 20 / mockUpHeight * size.height,
            controller: widget.numberOfRoomsController,
            keyboardType: TextInputType.number,
            style: abangTextStyles.smallTextStyle
                .copyWith(color: abangColors.abangWhite),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Please enter a room number.";
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
              hintStyle: abangTextStyles.smallTextStyle.copyWith(
                color: abangColors.abangPrimary.withOpacity(0.50),
              ),
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
                  color: abangColors.abangSecondary,
                  width: 2.0 / mockUpWidth * size.width,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(5 / mockUpWidth * size.width),
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
          padding:
              EdgeInsets.symmetric(horizontal: 11.5 / mockUpWidth * size.width),
          child: TextFormField(
            cursorColor: abangColors.abangPrimary,
            cursorHeight: 20 / mockUpHeight * size.height,
            controller: widget.avgRoomCapacityController,
            keyboardType: TextInputType.number,
            style: abangTextStyles.smallTextStyle
                .copyWith(color: abangColors.abangWhite),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Please enter average room capacity.";
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
              hintText: "Average Room Capacity",
              hintStyle: abangTextStyles.smallTextStyle.copyWith(
                color: abangColors.abangPrimary.withOpacity(0.50),
              ),
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
                  color: abangColors.abangSecondary,
                  width: 2.0 / mockUpWidth * size.width,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(5 / mockUpWidth * size.width),
                borderSide: BorderSide(
                  color: abangColors.abangSecondary,
                  width: 2.0 / mockUpWidth * size.width,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
