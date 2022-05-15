import 'package:abang/components/themes.dart';
import 'package:abang/controllers/create_house_code_controller.dart';
import 'package:abang/view/join/create/create/create_house_code_address.dart';
import 'package:abang/view/join/create/create/create_house_code_details.dart';
import 'package:abang/view/join/create/create/create_house_code_images.dart';
import 'package:abang/view/join/create/create/create_house_code_payments.dart';
import 'package:abang/view/join/create/create/create_house_code_rules_agreements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../components/constants.dart';

class CreateHouseCodeWrapper extends StatefulWidget {
  const CreateHouseCodeWrapper({Key? key}) : super(key: key);

  @override
  State<CreateHouseCodeWrapper> createState() => _CreateHouseCodeWrapperState();
}

class _CreateHouseCodeWrapperState extends State<CreateHouseCodeWrapper> {
  late TextEditingController _establishmentNameController;
  late TextEditingController _numberOfRoomsController;
  late TextEditingController _avgRoomCapacityContoller;
  late TextEditingController _roomRateController;

  @override
  void initState() {
    _establishmentNameController = TextEditingController();
    _numberOfRoomsController = TextEditingController();
    _avgRoomCapacityContoller = TextEditingController();
    _roomRateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _establishmentNameController.dispose();
    _numberOfRoomsController.dispose();
    _avgRoomCapacityContoller.dispose();
    _roomRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: abangColors.abangPrimary,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: 275 / mockUpHeight * size.height,
                        child: createHouseCodeController.currentPage == 1
                            ? Stack(
                                children: [
                                  Positioned(
                                    top: 67 / mockUpHeight * size.height,
                                    right: 50 / mockUpWidth * size.width,
                                    child:
                                        SvgPicture.asset("assets/details.svg"),
                                  ),
                                  Positioned(
                                    top: 210 / mockUpHeight * size.height,
                                    left: 50 / mockUpWidth * size.width,
                                    child: Text(
                                      "Become a landlord and\nadd establishment details here",
                                      textScaleFactor: textScale,
                                      textAlign: TextAlign.left,
                                      style: abangTextStyles.smallTextStyle
                                          .copyWith(
                                        color: abangColors.abangWhite,
                                        height: 1.50,
                                        letterSpacing: -0.01,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : createHouseCodeController.currentPage == 2
                                ? Stack(
                                    children: [
                                      Positioned(
                                        top: 70 / mockUpHeight * size.height,
                                        right: 33 / mockUpWidth * size.width,
                                        child: SvgPicture.asset(
                                            "assets/address.svg"),
                                      ),
                                      Positioned(
                                        top: 233 / mockUpHeight * size.height,
                                        left: 42 / mockUpWidth * size.width,
                                        child: Text(
                                          "Enter the address of your establishment here",
                                          textScaleFactor: textScale,
                                          textAlign: TextAlign.left,
                                          style: abangTextStyles.smallTextStyle
                                              .copyWith(
                                            color: abangColors.abangWhite,
                                            height: 1.50,
                                            letterSpacing: -0.01,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : createHouseCodeController.currentPage == 3
                                    ? Stack(
                                        children: [
                                          Positioned(
                                            top:
                                                66 / mockUpHeight * size.height,
                                            right:
                                                65 / mockUpWidth * size.width,
                                            child: SvgPicture.asset(
                                                "assets/images.svg"),
                                          ),
                                          Positioned(
                                            top: 233 /
                                                mockUpHeight *
                                                size.height,
                                            left:
                                                50.5 / mockUpWidth * size.width,
                                            child: Text(
                                              "Upload images of your establishment here",
                                              textScaleFactor: textScale,
                                              textAlign: TextAlign.left,
                                              style: abangTextStyles
                                                  .smallTextStyle
                                                  .copyWith(
                                                color: abangColors.abangWhite,
                                                height: 1.50,
                                                letterSpacing: -0.01,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : createHouseCodeController.currentPage == 4
                                        ? Stack(
                                            children: [
                                              Positioned(
                                                top: 66 /
                                                    mockUpHeight *
                                                    size.height,
                                                right: 55 /
                                                    mockUpWidth *
                                                    size.width,
                                                child: SvgPicture.asset(
                                                    "assets/payments.svg"),
                                              ),
                                              Positioned(
                                                top: 235 /
                                                    mockUpHeight *
                                                    size.height,
                                                left: 81.5 /
                                                    mockUpWidth *
                                                    size.width,
                                                child: Text(
                                                  "Upload images of your establishment here",
                                                  textScaleFactor: textScale,
                                                  textAlign: TextAlign.left,
                                                  style: abangTextStyles
                                                      .smallTextStyle
                                                      .copyWith(
                                                    color:
                                                        abangColors.abangWhite,
                                                    height: 1.50,
                                                    letterSpacing: -0.01,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Stack(
                                            children: [
                                              Positioned(
                                                top: 63 /
                                                    mockUpHeight *
                                                    size.height,
                                                right: 65 /
                                                    mockUpWidth *
                                                    size.width,
                                                child: SvgPicture.asset(
                                                    "assets/rules_agreements.svg"),
                                              ),
                                              Positioned(
                                                top: 235 /
                                                    mockUpHeight *
                                                    size.height,
                                                left: 58 /
                                                    mockUpWidth *
                                                    size.width,
                                                child: Text(
                                                  "Your establishment’s rules and agreements",
                                                  textScaleFactor: textScale,
                                                  textAlign: TextAlign.left,
                                                  style: abangTextStyles
                                                      .smallTextStyle
                                                      .copyWith(
                                                    color:
                                                        abangColors.abangWhite,
                                                    height: 1.50,
                                                    letterSpacing: -0.01,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                        child: createHouseCodeController.currentPage == 1
                            ? CreateHouseCodeDetails(
                                establishmentNameController:
                                    _establishmentNameController,
                                numberOfRoomsController:
                                    _numberOfRoomsController,
                                avgRoomCapacityController:
                                    _avgRoomCapacityContoller)
                            : createHouseCodeController.currentPage == 2
                                ? const CreateHouseCodeAdress()
                                : createHouseCodeController.currentPage == 3
                                    ? const CreateHouseCodeImages()
                                    : createHouseCodeController.currentPage == 4
                                        ? CreateHouseCodePayments(
                                            roomRateController:
                                                _roomRateController)
                                        : const CreateHouseCodeRulesAgreements(),
                      )),
                    ],
                  ),
                ),
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
                Positioned(
                  bottom: 50 / mockUpHeight * size.height,
                  right: 12 / mockUpWidth * size.width,
                  child: createHouseCodeController.currentPage == 1
                      ? GestureDetector(
                          onTap: () {
                            createHouseCodeController.setCurrentPage("Next");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                textScaleFactor: textScale,
                                style: abangTextStyles.nextTextStyle.copyWith(
                                  color: abangColors.abangWhite,
                                ),
                              ),
                              SizedBox(
                                width: 8 / mockUpWidth * size.width,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 24 / mockUpWidth * size.width,
                                color: abangColors.abangWhite,
                              ),
                            ],
                          ),
                        )
                      : createHouseCodeController.currentPage == 5
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    createHouseCodeController
                                        .setCurrentPage("Prev");
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios,
                                        size: 24 / mockUpWidth * size.width,
                                        color: abangColors.abangWhite,
                                      ),
                                      Text(
                                        "Prev",
                                        textScaleFactor: textScale,
                                        style: abangTextStyles.nextTextStyle
                                            .copyWith(
                                          color: abangColors.abangWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 182 / mockUpWidth * size.width),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Submit",
                                        textScaleFactor: textScale,
                                        style: abangTextStyles.nextTextStyle
                                            .copyWith(
                                          color: abangColors.abangWhite,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 24 / mockUpWidth * size.width,
                                        color: abangColors.abangWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    createHouseCodeController
                                        .setCurrentPage("Prev");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios,
                                        size: 24 / mockUpWidth * size.width,
                                        color: abangColors.abangWhite,
                                      ),
                                      Text(
                                        "Prev",
                                        textScaleFactor: textScale,
                                        style: abangTextStyles.nextTextStyle
                                            .copyWith(
                                          color: abangColors.abangWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 207 / mockUpWidth * size.width),
                                GestureDetector(
                                  onTap: () {
                                    createHouseCodeController
                                        .setCurrentPage("Next");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Next",
                                        textScaleFactor: textScale,
                                        style: abangTextStyles.nextTextStyle
                                            .copyWith(
                                          color: abangColors.abangWhite,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 24 / mockUpWidth * size.width,
                                        color: abangColors.abangWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
