import 'dart:io';

import 'package:abang/components/loading.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/controllers/create_house_code_controller.dart';
import 'package:abang/services/firestore_db.dart';
import 'package:abang/view/join/create/create/create_house_code_address.dart';
import 'package:abang/view/join/create/create/create_house_code_details.dart';
import 'package:abang/view/join/create/create/create_house_code_images.dart';
import 'package:abang/view/join/create/create/create_house_code_payments.dart';
import 'package:abang/view/join/create/create/create_house_code_rules_agreements.dart';
import 'package:abang/view/join/create/create/created_successfully.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../components/constants.dart';
import '../../../../models/models.dart';

class CreateHouseCodeWrapper extends StatefulWidget {
  const CreateHouseCodeWrapper({Key? key}) : super(key: key);

  @override
  State<CreateHouseCodeWrapper> createState() => _CreateHouseCodeWrapperState();
}

class _CreateHouseCodeWrapperState extends State<CreateHouseCodeWrapper>
    with FirestoreDataServices {
  late TextEditingController _establishmentNameController;
  late TextEditingController _numberOfRoomsController;
  late TextEditingController _avgRoomCapacityContoller;
  late TextEditingController _roomRateController;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();

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
    return createHouseCodeController.isLoading
        ? const AbangLoading(text: "Creating Establishment")
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
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
                                          child: SvgPicture.asset(
                                              "assets/details.svg"),
                                        ),
                                        Positioned(
                                          top: 210 / mockUpHeight * size.height,
                                          left: 50 / mockUpWidth * size.width,
                                          child: Text(
                                            "Become a landlord and\nadd establishment details here",
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
                                  : createHouseCodeController.currentPage == 2
                                      ? Stack(
                                          children: [
                                            Positioned(
                                              top: 70 /
                                                  mockUpHeight *
                                                  size.height,
                                              right:
                                                  33 / mockUpWidth * size.width,
                                              child: SvgPicture.asset(
                                                  "assets/address.svg"),
                                            ),
                                            Positioned(
                                              top: 233 /
                                                  mockUpHeight *
                                                  size.height,
                                              left:
                                                  42 / mockUpWidth * size.width,
                                              child: Text(
                                                "Enter the address of your establishment here",
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
                                      : createHouseCodeController.currentPage ==
                                              3
                                          ? Stack(
                                              children: [
                                                Positioned(
                                                  top: 66 /
                                                      mockUpHeight *
                                                      size.height,
                                                  right: 65 /
                                                      mockUpWidth *
                                                      size.width,
                                                  child: SvgPicture.asset(
                                                      "assets/images.svg"),
                                                ),
                                                Positioned(
                                                  top: 233 /
                                                      mockUpHeight *
                                                      size.height,
                                                  left: 50.5 /
                                                      mockUpWidth *
                                                      size.width,
                                                  child: Text(
                                                    "Upload images of your establishment here",
                                                    textScaleFactor: textScale,
                                                    textAlign: TextAlign.center,
                                                    style: abangTextStyles
                                                        .smallTextStyle
                                                        .copyWith(
                                                      color: abangColors
                                                          .abangWhite,
                                                      height: 1.50,
                                                      letterSpacing: -0.01,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : createHouseCodeController
                                                      .currentPage ==
                                                  4
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
                                                      left: 70 /
                                                          mockUpWidth *
                                                          size.width,
                                                      child: Text(
                                                        "Payments, rates, and other inclusions",
                                                        textScaleFactor:
                                                            textScale,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: abangTextStyles
                                                            .smallTextStyle
                                                            .copyWith(
                                                          color: abangColors
                                                              .abangWhite,
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
                                                      left: 50 /
                                                          mockUpWidth *
                                                          size.width,
                                                      child: Text(
                                                        "Your establishment’s rules and agreements",
                                                        textScaleFactor:
                                                            textScale,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: abangTextStyles
                                                            .smallTextStyle
                                                            .copyWith(
                                                          color: abangColors
                                                              .abangWhite,
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
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: abangColors.abangSecondary,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      50 / mockUpWidth * size.width),
                                  topRight: Radius.circular(
                                      50 / mockUpWidth * size.width),
                                ),
                              ),
                              child: createHouseCodeController.currentPage == 1
                                  ? CreateHouseCodeDetails(
                                      formKey: _formKey1,
                                      establishmentNameController:
                                          _establishmentNameController,
                                      numberOfRoomsController:
                                          _numberOfRoomsController,
                                      avgRoomCapacityController:
                                          _avgRoomCapacityContoller)
                                  : createHouseCodeController.currentPage == 2
                                      ? CreateHouseCodeAdress(
                                          formKey: _formKey2,
                                        )
                                      : createHouseCodeController.currentPage ==
                                              3
                                          ? const CreateHouseCodeImages()
                                          : createHouseCodeController
                                                      .currentPage ==
                                                  4
                                              ? CreateHouseCodePayments(
                                                  roomRateController:
                                                      _roomRateController,
                                                  formKey: _formKey3,
                                                )
                                              : CreateHouseCodeRulesAgreements(
                                                  formKey: _formKey4,
                                                ),
                            )),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 60 / mockUpHeight * size.height,
                        left: 20 / mockUpWidth * size.width,
                        child: IconButton(
                          onPressed: () {
                            createHouseCodeController.setCreateDataToDefault();
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
                                  if (_formKey1.currentState!.validate()) {
                                    createHouseCodeController
                                        .setCurrentPage("Next");
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Next",
                                      textScaleFactor: textScale,
                                      style: abangTextStyles.nextTextStyle
                                          .copyWith(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                              size:
                                                  24 / mockUpWidth * size.width,
                                              color: abangColors.abangWhite,
                                            ),
                                            Text(
                                              "Prev",
                                              textScaleFactor: textScale,
                                              style: abangTextStyles
                                                  .nextTextStyle
                                                  .copyWith(
                                                color: abangColors.abangWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              182 / mockUpWidth * size.width),
                                      GestureDetector(
                                        onTap: () async {
                                          var uuid = const Uuid();
                                          if (_formKey4.currentState!
                                              .validate()) {
                                            createHouseCodeController
                                                .setIsLoading(true);
                                            await createHouseCodeController
                                                .getCachedSignature();
                                            createHouseCodeController
                                                .generateHouseCode(
                                                    _establishmentNameController
                                                        .text
                                                        .trim(),
                                                    _numberOfRoomsController
                                                        .text
                                                        .trim());

                                            List<File?> images = [
                                              createHouseCodeController.image1,
                                              createHouseCodeController.image2,
                                              createHouseCodeController.image3,
                                              createHouseCodeController.image4,
                                            ];

                                            List<String> estPhotoURLS = [];

                                            estPhotoURLS =
                                                await uploadEstablishmentPhotos(
                                              images,
                                              createHouseCodeController
                                                  .houseCode!,
                                            );

                                            if (createHouseCodeController
                                                .paymentInclusionWidgets
                                                .isNotEmpty) {
                                              createHouseCodeController
                                                  .compilePaymentInclusionData();
                                            }

                                            if (createHouseCodeController
                                                .otherPaymentsWidgets
                                                .isNotEmpty) {
                                              createHouseCodeController
                                                  .compileOtherPaymentsData();
                                            }

                                            if (createHouseCodeController
                                                .rulesWidgets.isNotEmpty) {
                                              createHouseCodeController
                                                  .compileRulesData();
                                            }

                                            if (createHouseCodeController
                                                .agreementsWidgets.isNotEmpty) {
                                              createHouseCodeController
                                                  .compileAgreementsData();
                                            }

                                            AbangEstablishmentDetails
                                                establishment =
                                                AbangEstablishmentDetails(
                                              estType: createHouseCodeController
                                                      .selectedEstablishment ??
                                                  "",
                                              estName:
                                                  _establishmentNameController
                                                      .text
                                                      .trim(),
                                              numOfRooms: int.parse(
                                                _numberOfRoomsController.text
                                                    .trim(),
                                              ),
                                              avgRoomCapacity: int.parse(
                                                _avgRoomCapacityContoller.text
                                                    .trim(),
                                              ),
                                              roomRate: double.parse(
                                                _roomRateController.text.trim(),
                                              ),
                                              paymentInc:
                                                  createHouseCodeController
                                                      .paymentInclusionData,
                                              otherPayments:
                                                  createHouseCodeController
                                                      .otherPaymentsData,
                                              contractDetails: {
                                                "rules":
                                                    createHouseCodeController
                                                            .rulesData ??
                                                        {},
                                                "agreements":
                                                    createHouseCodeController
                                                            .agreementsData ??
                                                        {},
                                              },
                                              estImgURLs: estPhotoURLS,
                                              signatureURL:
                                                  createHouseCodeController
                                                          .signatureURL ??
                                                      "",
                                              idData: BaseData(
                                                landlordID: FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                houseCode:
                                                    createHouseCodeController
                                                        .houseCode!,
                                                dateCreated: DateTime.now(),
                                              ),
                                              locationID: uuid.v4(),
                                              region: createHouseCodeController
                                                      .region ??
                                                  "",
                                              province:
                                                  createHouseCodeController
                                                          .province ??
                                                      "",
                                              city: createHouseCodeController
                                                      .city ??
                                                  "",
                                              barangay:
                                                  createHouseCodeController
                                                          .barangay ??
                                                      "",
                                            );

                                            AbangUser user =
                                                await getUserDataToUpdateRole(
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid);
                                            AbangUser newUserData = AbangUser(
                                              userID: user.userID,
                                              role: "LANDLORD",
                                              dateCreated: user.dateCreated,
                                              userInfoID: user.userInfoID,
                                              firstName: user.firstName,
                                              middleName: user.middleName,
                                              lastName: user.lastName,
                                              contactNumber: user.contactNumber,
                                              avatarURL: user.avatarURL,
                                              signatureURL: user.signatureURL,
                                              email: user.email,
                                              locationID: user.locationID,
                                              region: user.region,
                                              province: user.province,
                                              city: user.city,
                                              barangay: user.barangay,
                                            );
                                            await updateUserRole(
                                                    newUserData.toMap(),
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                .whenComplete(() async {
                                              Map<String, dynamic> roomAvail =
                                                  {};
                                              for (int i = 1;
                                                  i <=
                                                      int.parse(
                                                          _numberOfRoomsController
                                                              .text
                                                              .trim());
                                                  i++) {
                                                roomAvail.addAll({
                                                  i.toString(): false,
                                                });
                                              }
                                              HouseCodes houseCode = HouseCodes(
                                                landlordID: establishment
                                                    .idData.landlordID,
                                                houseCode: establishment
                                                    .idData.houseCode,
                                                roomAvailability: roomAvail,
                                                occupied: 0,
                                                vacants: int.parse(
                                                    _numberOfRoomsController
                                                        .text
                                                        .trim()),
                                                tenants: 0,
                                              );
                                              await uploadEstablishmentData(
                                                      establishment.toMap(),
                                                      houseCode.toMap())
                                                  .whenComplete(() {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const EstablishmentCreationSuccessful()));
                                              });
                                            });
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Submit",
                                              textScaleFactor: textScale,
                                              style: abangTextStyles
                                                  .nextTextStyle
                                                  .copyWith(
                                                color: abangColors.abangWhite,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size:
                                                  24 / mockUpWidth * size.width,
                                              color: abangColors.abangWhite,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          createHouseCodeController
                                              .setCurrentPage("Prev");
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_back_ios,
                                              size:
                                                  24 / mockUpWidth * size.width,
                                              color: abangColors.abangWhite,
                                            ),
                                            Text(
                                              "Prev",
                                              textScaleFactor: textScale,
                                              style: abangTextStyles
                                                  .nextTextStyle
                                                  .copyWith(
                                                color: abangColors.abangWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              207 / mockUpWidth * size.width),
                                      GestureDetector(
                                        onTap: () {
                                          if (createHouseCodeController
                                                  .currentPage ==
                                              2) {
                                            if (_formKey2.currentState!
                                                .validate()) {
                                              createHouseCodeController
                                                  .setCurrentPage("Next");
                                            }
                                          } else if (createHouseCodeController
                                                  .currentPage ==
                                              3) {
                                            if (createHouseCodeController.image1 == null ||
                                                createHouseCodeController
                                                        .image2 ==
                                                    null ||
                                                createHouseCodeController
                                                        .image3 ==
                                                    null ||
                                                createHouseCodeController
                                                        .image4 ==
                                                    null) {
                                              createHouseCodeController
                                                  .setImageCheck(true);
                                            } else {
                                              createHouseCodeController
                                                  .setImageCheck(false);
                                              createHouseCodeController
                                                  .setCurrentPage("Next");
                                            }
                                          } else {
                                            if (_formKey3.currentState!
                                                .validate()) {
                                              createHouseCodeController
                                                  .setCurrentPage("Next");
                                            }
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Next",
                                              textScaleFactor: textScale,
                                              style: abangTextStyles
                                                  .nextTextStyle
                                                  .copyWith(
                                                color: abangColors.abangWhite,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size:
                                                  24 / mockUpWidth * size.width,
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
